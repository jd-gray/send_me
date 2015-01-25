class SessionsController < ApplicationController
	# def create
	# 	user = User.where(email: params[:login][:email]).first
	# 	if user && user.authenticate(params[:login][:password])
	# 		session[:user_id] = user.id.to_s
	# 		redirect_to vacations_path
	# 	else
	# 		redirect_to root_path
	# 	end
	# end

	# def destroy
	# 	# logout method to destroy the session
	# 	session.delete(:user_id)
	# 	redirect_to root_path
	# end
end
