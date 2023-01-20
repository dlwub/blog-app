require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @fifth_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
    @sixth_post = Post.create(author: @fifth_user, title: 'Hello', text: 'This is my first post')

    Comment.create(post: @sixth_post, author: @fifth_user, text: 'Hi Tom!')
    Comment.create(post: @sixth_post, author: @fifth_user, text: 'A good start!')
    Comment.create(post: @sixth_post, author: @fifth_user, text: 'Keep it up!')
    Comment.create(post: @sixth_post, author: @fifth_user, text: 'Well done!')
    Comment.create(post: @sixth_post, author: @fifth_user, text: 'exciting!')
  end
  it 'gives count of comments' do
    expect(@sixth_post.recent_comment.length).to eq 5
  end
  it 'gives count of posts' do
    expect(@fifth_user.posts_counter).to eq 2
  end
  subject do
    Post.new(author: @fifth_user, title: 'Hello', text: 'This is my first post')
  end
  before { subject.save }
  context 'validation tests' do
    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title should be less than or equal to 250 characters' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'subject.title should return Hello' do
      expect(subject.title).to eq 'Hello'
    end

    it 'comments_counter should be integer' do
      subject.comments_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'comments_counter should be integer greater than or equal to 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likes_counter should be integer' do
      subject.likes_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'likes_counter should be integer greater than or equal to 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
