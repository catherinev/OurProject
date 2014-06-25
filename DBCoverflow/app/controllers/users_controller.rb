
class UsersController < ApplicationController
	
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to questions_path
		else
			@error = "Invalid shit.  Try again."
			render new_user_path
		end
	end

	def edit

	end

	def show
	
	end

	def update
	
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

end
