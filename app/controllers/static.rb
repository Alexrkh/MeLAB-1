get '/crypto' do
  erb :"static/crypto"
end

get '/blockchain' do
  erb :"static/blockchain"
end

get '/ptwop' do
  erb :"static/ptwop"
end

get '/' do
  erb :"static/homepage"
end

get '/login' do
  erb :"static/login"
end

get '/signup' do
	erb :"static/signup"
end

get '/userpage' do
  @questions = Question.where(user_id: current_user.id)
  erb :"static/userpage"
end

post '/signup' do
	    if params[:password] == params[:password2]
		      user = User.new(:name=>params[:username],:email=>params[:email],:password=>params[:password])
			       if user.valid?
	    	 	         if user.save
	    			           @welcome = "Your Account has been created successfully!!!"
					             erb :"static/login"
    			        else
    				           @error3 = "your email is not valid!!!"
    				           erb :"static/signup"
       	 		       end
       	 	   else 
       	 		       @error4 = user.errors.messages
       	 		       erb :"static/signup"
       	 	   end
       else 
       	  @error2 = "Password does not match!!!"
       	  erb :"static/signup"
       end
end


post '/login' do
	user = User.find_by(:name=>params[:username])
	   if user && user.authenticate(params[:password])
		    session[:user_id] = user.id
        redirect '/melab_user'
      else
    	   @error = "Invalid username or password!!!"
    	   erb :"static/login"
	   end
end

get '/signout' do
	session[:user_id] = nil 
	redirect '/'
end

get '/quora' do
  redirect '/login'
end

get '/melab_user' do
  erb :"static/melab_user"
end

get '/teams' do
  erb :"static/teams"
end
