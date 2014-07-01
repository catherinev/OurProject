class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def not_found
    # Checkout this article:
    # http://blog.plataformatec.com.br/2012/01/my-five-favorite-hidden-features-in-rails-3-2/
    # Specifically point 3 on ways to handle this.

 	  raise ActionController::RoutingError.new('You do not have access to this page.')
	end
end
