require 'spec_helper'

feature 'User browsing the website'  do
  context 'on showpage no logged in' do
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
  end

  context 'on showpage and logged in' do
    before do
      @user = User.create(username: "pickles", email: "Ihatepicklesthefood@gmail.com", password: "notcake", password_confirmation: "notcake")
      page.set_rack_session(:user_id => @user.id)
      @question = Question.create(title: "BlahBlah", content: "More Blah", user_id: @user.id, category_id: 1)
      @question.answers << Answer.create(content: "You should do this...", user_id: @user.id)
      visit question_url(@question)
    end

    it 'should show the Add Answer button' do
      expect(page).to have_content("Add Answer")
    end
  end
end
