require 'spec_helper'

feature 'User logging in' do
	context 'on questions#show' do
		it "sees a Login link" do
			visit root_url
			expect(page).to have_content("Login")
		end
	end

end
