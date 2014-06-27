class SearchesController < ApplicationController
  def index
  	@questions = Question.search params[:q]
  end
end
