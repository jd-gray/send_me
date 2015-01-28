class UsersController < ApplicationController
	before_action :user_find, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
		@user=User.find(params[:id])
	end
	
	def new
		@disable_nav = true
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		# once user is created, create new session
		if @user.save
			session[:user_id] = @user.id.to_s
			redirect_to vacations_path
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		# once user updates profile directed to specified path
		if @user.update(user_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		# delete the user account
		@user.destroy
		session.delete(:user_id)
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :image, :body)
	end

	def user_find
		@user = User.find(params[:id])
	end

end
