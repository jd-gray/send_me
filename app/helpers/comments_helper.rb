module CommentsHelper
	def get_name(id)
		user = User.find(id)
		user.username
	end
end
