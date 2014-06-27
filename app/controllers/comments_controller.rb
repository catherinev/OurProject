class CommentsController < ApplicationController
  def create
    if params[:question_id]
      @comment = Comment.new(comment_params)
      @comment.user = current_user
      @question = Question.find(params[:question_id])
      @question.comments << @comment
      render partial: 'comment', locals: {comment: @comment}, layout: false
    else
      @comment = Comment.new(comment_params)
      @comment.user = current_user
      @answer = Answer.find(params[:answer_id])
      @answer.comments << @comment
      render partial: 'comment', locals: {comment: @comment}, layout: false
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
