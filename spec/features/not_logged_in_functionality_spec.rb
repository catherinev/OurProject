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

  context 'on showpage not logged in' do
    before do
      @user = User.create(username: "pickles", email: "Ihatepicklesthefood@gmail.com", password: "notcake", password_confirmation: "notcake")
      @question = Question.create(title: "BlahBlah", content: "More Blah", user_id: @user.id, category_id: 1)
      @question.answers << Answer.create(content: "You should do this...", user_id: @user.id)
      visit question_url(@question)
    end

    it 'should display title of the question' do
      expect(page).to have_content("BlahBlah")
    end

    it 'should display content of the question' do
      expect(page).to have_content("More Blah")
    end

    it 'should show all answers to a question' do
      expect(page).to have_content(@question.answers[0].content)
    end

    it 'should not have the Add Answer button' do
      expect(page).to_not have_content("Add Answer")
    end

    it 'should redirect the questions index when home link clicked' do
      click_link("Home")
      expect(current_url).to eq questions_url
    end

  end
end
