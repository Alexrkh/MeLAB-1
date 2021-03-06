#question#index
# get '/questions' do
# 	@view = Question.all
# 	erb :"questions/question_answer"
# end

get '/questions/answer' do
	@view = Question.all
	erb :"questions/question_answer"
end

# #question#show
get "/questions/:id" do
	@question = Question.find_by(:id => params[:id])
	erb :"questions/question_id"
end

# #question#new
post "/question/new" do
     @new_question = Question.create(:text=>params[:question],:user_id=> current_user.id)
     @new_question.to_json
     # new_question = current_user.questions.create(text: params[:questions])
     # @submited = "You have sucessfully submited a question!!!"
     # @questions = Question.all
     # redirect '/userpage'
end

# #question#edit
post '/question/:id/edit' do
	edit_question = Question.find_by(:id=>params[:id] )
	edit_question.update(text: params[:edit])
	@questions = Question.all
	redirect '/userpage'
end

post '/questions/:id/destroy' do
	delete_question = Question.find_by(:id=>params[:id])
    delete_question.destroy
    @questions = Question.all
	redirect '/userpage'
end

get '/questions/:id/answer/new' do
	@question = Question.find(params[:id])
	erb :"questions/question_answered" 
end

post '/questions/:id/answers' do
	@answer = Answer.new(:text=>params[:answer],:question_id=>params[:id],:user_id=>current_user.id)
	if @answer.save
		redirect '/questions/answer'
	else
		@error = "error while submitting your answer"
		redirect '/questions/answer'
	end
end

# #answer#index
# get '/question/:question_id/answers'
# end

# #answer#show
# get '/question/:question_id/answer/:answer_id'
# end

#show the question
# get '/questions/all' do
# 	@view = Question.all
# 	erb :"questions/question_answer"
# end





# get "/question/new" do
# 	erb :"questions/question"
# end

# get '/questions' do
# 	@questions = Question.where(user_id: current_user.id)
# 	erb :"questions/index"
# end





