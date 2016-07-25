enable :sessions

get '/' do
	if logged_in?
		erb :"static/profile"
	else
  		erb :"static/index"
  	end
end

get '/register' do
	if logged_in?
		erb :"static/profile"
	else
  		session[:error] = []
		erb :"static/signup"
  	end
end

post '/signup' do
	if logged_in?
		erb :"static/profile"
	else
  		user = User.new(params[:user])
		if user.save
			redirect '/'
		else
			session[:error]=user.errors.full_messages
			erb :"static/signup"
		end
  	end
end

post '/signin' do
	if logged_in?
		erb :"static/profile"
	else
  		login = User.find_by(email: params[:login][:email])
		if login && login.authenticate(params[:login][:password])
			session[:id] = login.id
			erb :"static/profile"
		else
			redirect '/'
		end
  	end
end

post '/signout' do
	session[:id]=nil
	redirect '/'
end