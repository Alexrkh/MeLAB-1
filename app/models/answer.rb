class Answer < ActiveRecord::Base
  belong_to :question
  belong_to :user

end
