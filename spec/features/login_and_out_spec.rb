require 'spec_helper'
include SessionsHelper

feature 'User logging in' do
	context 'on questions#show' do
		it "sees a Login link" do
			visit root_url
			expect(page).to have_content("Login")
		end

		it "should redirect to login page on click of login link" do
			visit root_url
			click_link("Login")
			expect(page).to have_content("Sign In")
			expect(current_url).to eq new_session_url
		end
	end

	context "on new_session_url page" do
		it "should create a user session upon successful login redirection" do
			@user = User.create(username: "hotcakes", email: "hotcakes@example.com", password: "notcake", password_confirmation: "notcake")

			visit new_session_url
			within('.loginform') do
				fill_in 'Email', with: "hotcakes@example.com"
				fill_in 'Password', with: "notcake"
			end
			click_button('Sign In')
			expect(page).to have_content("Add Question")
			expect(current_url).to eq questions_url
			expect{session[:user_id]}.to_not be nil
		end

		it "should not log in an unregistered user" do	
			visit new_session_url
			within('.loginform') do
				fill_in 'Email', with: "abcdefghi@jklmnop.com"
				fill_in 'Password', with: "password"
			end
			click_button('Sign In')
			expect(page).to have_content("Your email and password do not match")
			expect(current_url).to eq sessions_url

		end
	end

end
