require 'bcrypt'

class User < ActiveRecord::Base
  has_many :answers
  has_many :questions
  has_secure_password

def self.password()
	@password = params[:password]

	user = User.new

	#take the password from the form and save here.
end
