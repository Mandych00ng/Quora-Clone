require 'bcrypt'

class User < ActiveRecord::Base
	# attr_accessor :password
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :email, uniqueness:{case_sensitive: false, message:"Bad email"} 
	validates :password, length: { in: 6..30 }

	has_many :questions
	has_many :answers

	has_secure_password
	
	# def password
	# 	@password ||= Password.new(encrypted_password)
	# end

	# def password=(new_password)
	# 	@password = Password.create(new_password)
	# 	self.encrypted_password = @password
	# end

end