require 'spec_helper'

feature 'creating a user' do
	context 'on users#new page' do
		it "should create a new user" do
			visit new_user_url
			fill_in 'Username', with: "trickyricky"
			fill_in 'Email', with: "trickyricky@tricks.com"
			fill_in 'Password', with: "notcake"
			fill_in 'Password confirmation', with: "notcake"
			click_button('Create Me!')
			expect(current_url).to eq questions_url
			expect(User.find_by_email("trickyricky@tricks.com")).to be

		end
	end
end