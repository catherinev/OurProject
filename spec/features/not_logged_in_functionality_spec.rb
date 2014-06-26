require 'spec_helper'

feature 'User browsing the website'  do
  context 'on homepage' do
    it "sees a list of recent posts titles" do
      question = Question.create(title: "BlahBlah", content: "More Blah", user_id: 1, category_id: 1)
      visit root_url
      expect(page).to have_content("BlahBlah")
    end

    it "when not logged don't see features that require sign in" do
      visit root_url
      expect(page).to_not have_content("Logout")
      expect(page).to_not have_content("Add Question")
      expect(page).to_not have_content("Profile")
    end

    it "should redirect to show page on click of question link" do
      question = Question.create(title: "BlahBlah", content: "More Blah", user_id: 1, category_id: 1)
      visit root_url
      click_link("BlahBlah")
      expect(page).to have_content("More Blah")
      expect(current_url).to eq question_url(question)
    end

    it 'should redirect to category page on click of browse' do
      visit root_url
      click_link("Browse")
      expect(current_url).to eq categories_url
    end

    it 'should redirect to login page on click of login' do
      visit root_url
      click_link("Login")
      expect(current_url).to eq new_session_url
    end
    it 'should redirect to signup page on click of create account' do
      visit root_url
      click_link("Create Account")
      expect(current_url).to eq new_user_url
    end
  end
end
