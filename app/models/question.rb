class Question < ActiveRecord::Base
  has_many :answers
  belong_to :user

end
