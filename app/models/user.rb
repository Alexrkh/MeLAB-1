require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :answers
  has_many :questions
  has_secure_password
validates :name, presence: true
validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Please enter a valid e-mail"  }
##validates correct format of email
validates :email, uniqueness: true
##validates that email address has not been registered before
validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).{6,}\Z/, message: "Please enter a password which is at least 6 characters and includeds one number and one letter" }


end
