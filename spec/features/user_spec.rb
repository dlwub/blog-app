require 'rails_helper'

RSpec.describe 'User', type: :feature do
	before :each do
		@user = User.create(
			name: 'Zaid', 
			photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
			bio: 'Teacher from Addis.'			
		)
		(1..4).each do |i|
			Post.create(id: i, author: @user, title: 'Hello', text: "This is my post number #{i}")
		end
		@another_user = User.create(
			name: 'Luchia', 
			photo: 'https://unsplash.com/photos/F_-0BxGuVyz', 
			bio: 'Teacher from Nairobi.'			
		)

		(1..2).each do |i|
			Post.create(author: @another_user, title: 'Hi', text: "This is post number #{i} of mine")
		end
		visit users_path
		sleep(5)
	end
	describe 'user index page' do
		it 'shows the user name' do			
			expect(page).to have_content('Zaid')
			expect(page).to have_content('Luchia')
		end
		it 'shows the image' do
			expect(page.body).to include('https://unsplash.com/photos/F_-0BxGuVvo')
			expect(page.body).to include('https://unsplash.com/photos/F_-0BxGuVyz')
		end
		it 'shows number of posts' do					
			expect(page).to have_content('Number of posts: 4')
			expect(page).to have_content('Number of posts: 2')
		end

		it 'redirects to the first user page' do
			click_link 'Zaid'
			expect(page).to have_content('Teacher from Addis.')			
		end

		it 'redirects to the first user page' do
			click_link 'Luchia'
			expect(page).to have_content('Teacher from Nairobi.')
		end
	end

	describe 'user show page' do
		before :each do
			visit user_path(@user)
		end
		it 'shows the user name' do			
			expect(page).to have_content('Zaid')			
		end
		it 'shows the image' do
			expect(page.body).to include('https://unsplash.com/photos/F_-0BxGuVvo')			
		end
		it 'shows number of posts' do					
			expect(page).to have_content('Number of posts: 4')			
		end

		it "shows the user's bio" do			
			expect(page).to have_content('Teacher from Addis.')			
		end

		it 'has 3 recent lists' do
			(2..4).each do |i|
				expect(page).to have_content("This is my post number #{i}")
			end				
		end

		it 'redirects to the first user page' do
			click_link 'See all posts'
			(1..4).each do |i|
				expect(page.body).to have_content("This is my post number #{i}")
			end	
		end	
		
		it "redirects to post's show page" do
			click_link 'Post # 4'
			expect(page).to have_content("Post # 4 by Zaid")
		end

		it "redirects to post's show page" do
			click_link 'See all posts'
			expect(page).to have_content("Pagination")
		end
	end
end