module QuestionsHelper
  def question_params
    params.require(:question).permit(:title, :content, :category_id)
  end
end
