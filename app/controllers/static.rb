get '/' do
  @error = params[:x]
  erb :"static/index"
end

get '/signup' do
	erb :"static/signup"
end

post '/signup' do
	if params[:password] == params[password_comfirmation]
	user = User.new(:name=>params[:username],:email=>params[:email],:password=>params[:password],)
		if user.save
		redirect 'sessions/login'
    	else
    	redirect '/? x= signup fail'
		end
	redirect '/? x= signup fail'
end


post '/login' do
	user = User.find_by(:username=>params[:username])
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
	redirect 'static/question'
    else
    redirect '/? x= signup fail'
	end
end

get '/sessions' do
	 erb 'static/question'
end

get '/sessions/logout' do
	session.clear
	redirect '/'

end

