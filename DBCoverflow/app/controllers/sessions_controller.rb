
class SessionsController < ApplicationController

	def create
		@user = User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			redirect_to questions_path
		else
			@error = "Your email and password do not match."
			render new_session_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to questions_path
	end

end
