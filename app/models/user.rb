
class User < ActiveRecord::Base
	# attr_accessor :password_digest
	# attr_accessible :email, :password_digest, :username
	
	include ActiveModel::SecurePassword
	
	has_secure_password
	has_many :photos

	validates_presence_of :username, :email, :password_digest
end
