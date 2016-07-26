get '/sessions/new' do
	erb :"sessions/new"
end

post '/sessions' do
	if logged_in?
		redirect to '/users/' + current_user.id.to_s
	else
  		login = User.find_by(email: params[:login][:email])
		if login && login.authenticate(params[:login][:password])
			session[:id] = login.id
			session[:username] = login.username
			redirect to '/users/' + current_user.id.to_s
		else
			redirect to '/sessions/new'
		end
  	end
end

delete '/sessions' do
	session[:id]=nil
	redirect '/'
end