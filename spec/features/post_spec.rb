require 'rails_helper'
RSpec.describe 'Page', type: :feature do
  before :each do
    @user = User.create(
      name: 'Zaid',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Addis.'
    )
    @post_1 = Post.create(id: 1, author: @user, title: 'Hello', text: 'This is my post number 1')
    @post_2 = Post.create(id: 2, author: @user, title: 'Hello', text: 'This is my post number 2')
    @post_3 = Post.create(id: 3, author: @user, title: 'Hello', text: 'This is my post number 3')
    @post_4 = Post.create(id: 4, author: @user, title: 'Hello', text: 'This is my post number 4')
    (1..6).each do |_i|
      Comment.create(post: @post_1, author: @user, text: 'Hello Zaid!')
    end
    (1..5).each do |_i|
      Like.create(post: @post_1, author: @user)
    end
    visit user_posts_path(@user)
    sleep(5)
  end
  describe 'user post index page' do
    it 'shows the image' do
      expect(page.body).to include('https://unsplash.com/photos/F_-0BxGuVvo')
    end
    it 'shows the user name' do
      expect(page).to have_content('Zaid')
    end
    it 'shows number of posts' do
      expect(page).to have_content('Number of posts: 4')
    end
    it "shows the post's title" do
      expect(page).to have_content('Hello')
    end
    it "shows the post's body" do
      expect(page).to have_content('This is my post number 1')
    end
    it 'shows the first comments on a post' do
      expect(page).to have_selector('br', count: 5)
    end
    it 'shows the number of comments the post has' do
      expect(page).to have_content('Comments: 6')
    end
    it 'shows the number of likes the post has' do
      expect(page).to have_content('Likes: 5')
    end
    it 'option for pagination' do
      expect(page).to have_content('Pagination')
    end
    it 'redirects to user posts show page' do
      click_link 'Post # 1'
      expect(page).to have_selector('br', count: 6)
    end
  end
  describe 'post show page' do
    before :each do
      visit user_post_path(@user, @post_1)
    end
    it "shows the post's title" do
      expect(page).to have_content('Hello')
    end
    it 'shows the author' do
      expect(page).to have_content('by Zaid')
    end
    it 'shows number of comments' do
      expect(page).to have_content('Comments: 6')
    end
    it 'shows number of likes' do
      expect(page).to have_content('Likes: 5')
    end
    it 'shows the posts body' do
      expect(page).to have_content('This is my post number 1')
    end
    it 'shows the user name of each commentor' do
      expect(page).to have_content('Zaid:', count: 6)
    end
    it 'shows the comment of each commentor' do
      expect(page).to have_content('Hello Zaid!', count: 6)
    end
  end
end
