require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @sixth_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
    @seventh_post = Post.create(author: @sixth_user, title: 'Hello', text: 'This is my first post')
    Like.create(author: @sixth_user, post: @seventh_post)
  end

  it 'gives count of likes' do
    expect(@seventh_post.likes_counter).to eq 1
  end
end
