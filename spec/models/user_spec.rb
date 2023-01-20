require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @sixth_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
    Post.create(author: @sixth_user, title: 'Hello', text: 'This is my first post')
    Post.create(author: @sixth_user, title: 'Hello', text: 'This is my first post')
    Post.create(author: @sixth_user, title: 'Hello', text: 'This is my first post')
  end

  it 'gives count of posts' do
    expect(@sixth_user.recent_posts.length).to eq 3
  end

  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  before { subject.save }
  context 'testing validations' do
    it 'title should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'subject.name should return Tom' do
      expect(subject.name).to eq 'Tom'
    end

    it 'posts_counter should be integer' do
      subject.posts_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be integer greater than or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
