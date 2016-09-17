require 'rails_helper'

describe Post do
  it 'belongs to a user' do
    expect(Post.new).to respond_to(:user)
  end

  it 'has content' do
    expect(Post.new).to respond_to(:content)
  end

  it 'cannot be empty' do
    expect(Post.new).to be_invalid
  end

  it 'its contents can be edited' do    #My, my, what a silly test this is...
    post = Post.create(content: "This is a boring post.")
    new_content = "There will be blood."
    post.update(content: new_content)
    expect(post.content).to eq(new_content)
  end

end
