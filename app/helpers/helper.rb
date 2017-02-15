helpers do

upvotes = "0"
downvotes = "0"
	
def current_user
	User.find_by(id: session[:user_id])
 end

def quest_id(question)
   "questions/#{question.id}"
 end

def self.upvote(id)
    self.where(:id => id).update_all("upvotes = upvotes + 1")
  end

def self.downvote(id)
 	self.where(:id => id).update_all("downvotes = upvotes - 1")
 end

 def create_answer_url(question)
 	"/questions/#{question.id}/answers"
 end

end
