enable :sessions

get '/' do
	if logged_in?
		redirect to "/users/" + current_user.id.to_s
	else
		@questions = Question.all.paginate(page: params[:page], per_page: 3)
  		erb :"static/index"
  	end
end
