class CommentsController < ApplicationController
  def create
    @comment = Comment.create(content: params[:comment][:content], user_id: session[:user_id], parent_type: params[:comment][:parent_type], parent_id: params[:question_id])
    render partial: 'comment', locals: {comment: @comment}, layout: false
  end
end
