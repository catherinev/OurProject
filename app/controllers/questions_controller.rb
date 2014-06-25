class QuestionsController < ApplicationController
  include QuestionsHelper
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @comments = @question.comments.all
    @answers = @question.answers.all
  end

  def new
    @categories = Category.all
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to question_url(@question)
    else
      render :new, :flash => {:error => "We were not able to add your question."}
    end

  end


  def edit
    @question = Question.find(params[:id])
    @user = current_user
    @categories = Category.all
    if @question
      render :edit
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
       flash[:notice] = "you win"
       redirect_to question_path(@question)
    else
      render :edit
    end
  end

end
