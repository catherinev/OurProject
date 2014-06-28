require 'spec_helper'

feature 'User browsing the website'  do
  context 'on homepage' do
    it "sees a list of recent posts titles" do
      question = Question.create(title: "BlahBlah", content: "More Blah", user_id: 1, category_id: 1)
      visit root_url
      expect(page).to have_content("BlahBlah")
    end

    it "when logged in should show user features" do
      @user = User.create(username: "pickles", email: "Ihatepicklesthefood@gmail.com", password: "notcake", password_confirmation: "notcake")
      page.set_rack_session(:user_id => @user.id)
      visit root_url
      expect(page).to have_content("Logout")
      expect(page).to have_content("Add Question")
      expect(page).to have_content("Profile")
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

     it 'should redirect to add question when click add question' do
      @user = User.create(username: "pickles", email: "Ihatepicklesthefood@gmail.com", password: "notcake", password_confirmation: "notcake")
      page.set_rack_session(:user_id => @user.id)
      visit root_url
      click_link("Add Question")
      expect(current_url).to eq new_question_url
    end
    it 'should be logged out and redirected to homepage on click of logout' do
      @user = User.create(username: "pickles", email: "Ihatepicklesthefood@gmail.com", password: "notcake", password_confirmation: "notcake")
      page.set_rack_session(:user_id => @user.id)
      visit root_url
      click_link("Logout")
      expect(current_url).to eq questions_url
      expect(page.get_rack_session).to_not have_key("user_id")
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

feature 'User can answer a question' do
  context 'on question page' do

    it 'should show answers content on the current question page' do

      question = Question.create(title: "BlahBlah", content: "More Blah", user_id: 1, category_id: 1)
      @user = User.create(username: "pickles", email: "Ihatepicklesthefood@gmail.com", password: "notcake", password_confirmation: "notcake")
      page.set_rack_session(:user_id => @user.id)
      visit question_path(question.id)
      within('.answerform') do
        fill_in 'Content', with: "this is my content"
      end
        click_button('Add Answer')
      expect(page).to have_content('this is my content')
    end
  end
end

feature 'User can edit their question' do
  context 'on question page' do

    it 'should change the content of the question after editing.' do
      @user = User.create(username: "pickles", email: "Ihatepicklesthefood@gmail.com", password: "notcake", password_confirmation: "notcake")
      question = Question.create(title: "BlahBlah", content: "Main question", user_id: @user.id, category_id: 1)
     
      page.set_rack_session(:user_id => @user.id)
      visit question_path(question.id)

      within('#edit_link_for_question') do
        click_link('Edit')
      end
      within(".edit_question") do
        fill_in 'Content', with: "This is the changed content"
      end
      click_button('Update Question')
      expect(page).to have_content('This is the changed content')
    end
  end
end

feature 'User can edit their answer' do
  context 'on question page' do

    xit 'should change the content of their answer on page.' do
      @user = User.create(username: "pickles", email: "Ihatepicklesthefood@gmail.com", password: "notcake", password_confirmation: "notcake")
      question = Question.create(title: "BlahBlah", content: "Main question", user_id: @user.id, category_id: 1)
      answer = Answer.create(content: "Fibonacci", user_id: @user.id, question_id: question.id )
     
      page.set_rack_session(:user_id => @user.id)
      visit question_path(question.id)

      within('#edit_answer') do
        click_link('Edit')
      end
      within(".edit_answer") do
        fill_in 'Content', with: "not Fibonacci."
      end
      click_button('Update Answer')
      expect(page).to have_content('not Fibonacci')
    end
  end
end

feature 'User can comment on a question' do
  context 'on question page' do

    xit 'should show a comment for question' do
      question = Question.create(title: "BlahBlah", content: "More Blah", user_id: 1, category_id: 1)
      @user = User.create(username: "pickles", email: "Ihatepicklesthefood@gmail.com", password: "notcake", password_confirmation: "notcake")
      page.set_rack_session(:user_id => @user.id)

      visit question_path(question.id)

        click_button('Add Comment')

      within('.commentform') do
        fill_in 'Content', with: "nice post."
      end
      click_button('Post Comment')
      expect(page).to have_content("nice post.")
    end
  end
end

feature 'User can comment on an answer' do
  context 'on question page' do

    xit 'should show a comment on an answer for question' do
      question = Question.create(title: "BlahBlah", content: "More Blah", user_id: 1, category_id: 1)
      @user = User.create(username: "pickles", email: "Ihatepicklesthefood@gmail.com", password: "notcake", password_confirmation: "notcake")
      answer = Answer.create(content: "API",user_id: @user.id ,question_id: question.id )
      page.set_rack_session(:user_id => @user.id)

      visit question_path(question.id)
      within('#comment_on_answer') do
        click_button('Comment')
      end
      within('#add_comment_to_answer') do
        fill_in 'Content', with: "This answer is incorrect!"
      end
      click_button('Comment')
      expect(page).to have_content('This answer is incorrect!')
    end
  end
end



