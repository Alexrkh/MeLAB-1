get "/question/new" do
	erb :"static/question"
end

post "/question/new" do
     new_question = Question.create(:text=>params[:question])
     @submited = "You have sucessfully submited a question"
     redirect '/questions'

end

get "/question/id" do
	erb :"static/answer"
end

get '/questions' do
	@questions = Question.all
	erb :"questions/index"
end

get '/question/id' do
	erb :"static/answer"
end
