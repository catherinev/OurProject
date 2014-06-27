
class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to questions_path
		else
			@error = "Invalid shit.  Try again."
			render 'new'
		end
	end

	def edit
		if current_user == User.find(params[:id])
			@user = current_user
			render 'edit'
		else
			not_found
		end

	end

	def show
		if current_user == User.find(params[:id])
			@user = current_user
			@questions = current_user.questions
			render 'show'
		else
			not_found
		end
	end

	def update
		if current_user == User.find(params[:id])
			# look at the check for current user security shit
			current_user.update(user_params)
			redirect_to user_path(current_user)
		else
			not_found
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

end
