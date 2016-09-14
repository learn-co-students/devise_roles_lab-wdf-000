describe PostsController do

  #### Requirements for the PostsController
  # Posts can be created by any user
  # Anyone can read any post
  # Users can edit or delete Posts they own
  # VIPs can edit anyone's Posts
  # Admins can do anything to any post.


  describe '#index' do
     
  end

  describe '#show' do

  end

  describe '#create' do

  end

  describe '#destroy' do

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
  end
end
