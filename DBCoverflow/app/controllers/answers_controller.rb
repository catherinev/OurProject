class AnswersController < ApplicationController
  def create
    p params
    @answer = Answer.create(content: params[:answer][:content], user_id: session[:user_id], question_id: params[:question_id])
    render partial: 'answer', locals: {answer: @answer}
  end
end
