require 'rails_helper'

RSpec.describe 'User', type: :feature do
	before :each do
		@user = User.create(
			name: 'Zaid', 
			photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
			bio: 'Teacher from Addis.',
			posts_counter: 2
		)
		visit users_path
		sleep(5)
	end
	describe 'user index page' do
		it 'shows the user name' do			
			expect(page).to have_content('Zaid')
		end
		it 'shows the image' do
			expect(page.body).to include('https://unsplash.com/photos/F_-0BxGuVvo')
		end
		it 'shows number of posts' do					
			expect(page).to have_content('Number of posts: 2')
		end

		it 'redirects to the individual user page' do
			click_link 'Zaid'
			expect(page).to have_content('Teacher from Addis.')
		end
	end
end