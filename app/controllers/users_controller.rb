get '/users/new' do
	if logged_in?
		redirect to '/users/' + current_user.id.to_s
	else
  		session[:error] = []
		erb :"users/new"
  	end
end

get '/users/:id' do
	@questions = Question.all
	erb :"users/show"
end

post '/users' do
	if logged_in?
		erb :"users/profile"
	else
  		user = User.new(params[:user])
		if user.save
			redirect '/'
		else
			session[:error]=user.errors.full_messages
			erb :"users/new"
		end
  	end
end