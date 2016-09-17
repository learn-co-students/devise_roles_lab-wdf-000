require 'spec_helper'
require 'rails_helper'
describe PostsController do

  describe '#show & #index' do #Combined as these pages use the same partial, anyway
    render_views  #This line is required for capybara to actually render the page
    context 'any user', type: :feature do #type::feature needed to be able to run 'visit' outside of spec/features-directory

      it 'allows any user to see any post' do
        created_post = Post.create(content: 'this post is about beef jerky', user: FactoryGirl.create(:user))
        user = FactoryGirl.create(:user)
        sign_in(user.email, user.password)
        visit posts_path
        expect(page).to have_content 'this post is about beef jerky'
      end
    end
  end

  describe '#create' do
    context 'any user' do
      before do
        sign_in!
      end
      it 'allows creating a new post' do
        post :create, post: { content: 'repetitio ad nauseam' }
        expect(Post.find_by(content: 'repetitio ad nauseam').content).to eq('repetitio ad nauseam')
      end
    end
    context 'someone who has not logged on' do
      it 'can not create a new post' do
        post :create, post: { content: 'repetitio ad nauseam' }
        expect(Post.find_by(content: 'repetitio ad nauseam')).to eq(nil)
      end
    end
  end

  describe '#destroy' do
    context 'regular user' do
      before do
        sign_in!
      end
      it 'does not allow destroying other posts' do
        created_post = Post.create(content: 'look at _my_ post!', user_id: 999)
        expect {
          delete :destroy, id: created_post.id
        }.not_to change(Post, :count)
      end
    end
    context 'vip user' do
      before do
        sign_in!('vip')
      end
      it 'does not allow destroying other posts' do
        created_post = Post.create(content: 'look at _my_ post!', user_id: 999)
        expect {
          delete :destroy, id: created_post.id
        }.not_to change(Post, :count)
      end
    end
    context 'admin user' do
      before do
        sign_in!('admin')
      end
      it 'allows destroying other posts' do
        created_post = Post.create(content: 'look at _my_ post!', user_id: 999)
        expect {
          delete :destroy, id: created_post.id
        }.to change(Post, :count).by(-1)
      end
    end
    context 'same user' do
      before do
        sign_in!
      end
      it 'allows destroying own posts' do
        post :create, post: { content: 'this is my post!' }
        created_post = Post.find_by(content: 'this is my post!')
        delete :destroy, id: created_post.id
        expect(Post.find_by(content: 'repetitio ad nauseam')).to eq(nil)
      end
    end
  end

  describe '#update' do
    context 'neither admin nor vip' do
      before do
        sign_in!
      end

      it 'does not allow the request' do
        created_post = create(:post, content: 'bar')

        expect {
          post :update, id: created_post.id, post: { content: 'foo' }
        }.not_to change(created_post, :content)
      end
    end

    context 'vip' do
      before do
        sign_in!('vip')
      end

      it 'allows the request' do
        created_post = create(:post, content: 'bar')

        post :update, id: created_post.id, post: { content: 'foo' }

        expect(created_post.reload.content).to eq('foo')
      end
    end

    context 'admin' do
      before do
        sign_in!('admin')
      end

      it 'allows the request' do
        created_post = create(:post, content: 'bar')

        post :update, id: created_post.id, post: { content: 'foo' }

        expect(created_post.reload.content).to eq('foo')
      end
    end
    context 'owner of the post' do
      before do
        sign_in!
      end
      it 'allows the request' do
        post :create, post: { content: 'my post!', user_id: 1  }
        created_post = Post.find_by(content: 'my post!')
        post :update, id: created_post.id, post: { content: 'Hear me ROAR!'}
        expect(created_post.reload.content).to eq('Hear me ROAR!')
      end
    end
  end

end
