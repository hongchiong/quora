require 'byebug'
enable :sessions

get '/' do
  erb :"static/index"
end

get '/register' do
		erb :"static/signup"
end

post '/signup' do
	user = User.new(params[:user])
	user.save
	if user.save
		redirect '/'
	else
		session[:error]=user.errors.full_messages
		redirect '/register'
	end
end

post '/signin' do
	login = User.find_by(email: params[:login][:email])
	if login && login.authenticate(params[:login][:password])
		session[:id] = login.id
		erb :"static/profile"
	else
		redirect '/'
	end
end

post '/signout' do
	session[:id]=nil
	redirect '/'
end