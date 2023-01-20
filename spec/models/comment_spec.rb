require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @fourth_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.')
    @fifth_post = Post.create(author: @fourth_user, title: 'Hello', text: 'This is my first post')
  end

  it 'gives count of comments' do
    expect(@fifth_post.comments_counter).to eq 0
  end
end
