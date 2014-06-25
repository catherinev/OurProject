class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @comments = @question.comments.all
    @answers = @question.answers.all
  end

  def create
  end

  def update
  end

  def destroy
  end

  def new
  end

  def edit
  end
end
