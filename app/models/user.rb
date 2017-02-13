require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  attr_reader :name
  has_many :answers
  has_many :questions
  has_secure_password


end
