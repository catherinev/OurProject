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
    end
    it "when logged in should show user features" do
      @user = User.create(username: "pickles", email: "Ihatepicklesthefood@gmail.com", password: "notcake", password_confirmation: "notcake")
      page.set_rack_session(:user_id => @user.id)
      visit root_url
      expect(page).to have_content("Logout")
      expect(page).to have_content("Add Question")
    end
  end
end
