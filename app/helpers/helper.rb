helpers do
	
def current_user
	User.find_by(id: session[:user_id])
end

def quest_id(question)
   "questions/#{question.id}"
end


end