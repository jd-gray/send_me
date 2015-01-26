module SessionsHelper
	# current user method
	def current_user
		# use what is stored in the session
		# to find who the user is
		@current_user ||= User.find(session[:user_id])
	end

	# method to determine if a user is logged in
	def logged_in?
		session[:user_id] != nil
	end

	# method to determine if correct user can access info
	def user_authorized?
		if session[:user_id] === nil
			redirect_to root_path
		end
	end

	def same_user?
		if @user.username != current_user.username
			redirect_to vacations_path
		end
	end
end
