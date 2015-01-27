class User < ActiveRecord::Base
	mount_uploader :imagae, ImageUploader
	has_many :vacations

	# USERNAME
	# validates the presence of username
	validates_presence_of :username

	# EMAIL
	# make sure user enters an email
	validates :email, presence: true

	# email is to be no longer then 100 characters
	validates_length_of :email, maximum: 100

	# make sure user enters a valid email address
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	# email must be unique and not the same as other users
	validates_uniqueness_of :email

	# PASSWORD
	# user must enter a password
	# user must have a password no shorter then 6 char and no longer then 20 char
	validates :password, presence: true, length: { in: 6..20 }, confirmation: true

	attr_reader :password

	def password=(unencrypted_password)
		unless unencrypted_password.empty?
			# store the password in memory
			@password = unencrypted_password
			# using BCrypt to encrypt the plain text password
			# after encryption, store in database
			self.password_digest = BCrypt::Password.create(unencrypted_password)
		end
	end

	# this method provides user authentication
	# if the user enters the password that matches encrypted password
	# return self
	def authenticate
		if BCrypt::Password.new(self.password_digest) == unencrypted_password
			return self
		else
			return false
		end
	end
end
