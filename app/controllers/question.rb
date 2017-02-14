#show the question
get "/questions/:id" do
	@question = Question.find_by(:id => params[:id])
	erb :"questions/question2"
end

post "/question/new" do
     new_question = Question.create(:text=>params[:question],:user_id=> current_user.id)
     # new_question = current_user.questions.create(text: params[:questions])
     @submited = "You have sucessfully submited a question!!!"
     erb :"questions/question"

end

get "/question/new" do
	erb :"questions/question"
end

get '/questions' do
	@questions = Question.where(user_id: current_user.id)
	erb :"questions/index"
end

get '/questions/:id/edit' do
end
