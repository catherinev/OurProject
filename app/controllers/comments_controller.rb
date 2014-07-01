class CommentsController < ApplicationController
  def create
    # determine parent
    if params[:question_id]
      parent = Question.find(params[:question_id])
    else
      parent = Answer.find(params[:answer_id])
    end
    # build the comment object
    comment = Comment.new(comment_params.merge(user: current_user, parent: parent))
    render partial: 'comment', locals: {comment: comment}, layout: false
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
