class User < ApplicationRecord

	validates :name, presence: true, length: { maximum: 50 }

	validates :password, presence: true, length: { minimum: 6 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	# adds ability to save a hashed password_digest to db
	# adds 2 virtual attributes "password" & "password_confirmation", incl presence validations and a validation requiring that they match
	# adds an authenticate method that returns the user when the password is correct (and false otherwise) 
	# for this to work, requires the model to have an attribute called "password_digest"
	has_secure_password

	private
		before_save { self.email = self.email.downcase }

end
