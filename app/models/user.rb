class User < ActiveRecord::Base
	has_secure_password 

	validates :name, :email, :password_digest, presence: true
	validates :email, email: true
	validates :password, password: true

end
