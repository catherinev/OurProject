class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def not_found
 	  raise ActionController::RoutingError.new('You do not have access to this page.')
	end
end
