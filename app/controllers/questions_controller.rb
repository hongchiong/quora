post '/questions' do
	if logged_in?
		@question = Question.create(user_id: current_user.id, body: params[:question])
		redirect to '/questions/' + current_user.id.to_s
	else
		erb :'session/new'
	end
end

get '/questions/:id' do
	# @question = Question.find(params[:user_id])
	@question = Question.where(user_id: params[:id])
	erb :'questions/show'
end

get '/questions/:id/edit' do
	# @question = Question.find(params[:user_id])
	@question = Question.find_by(id: params[:id])
	erb :'questions/edit'
end

put '/questions/:id' do 
	@question = Question.find_by(id: params[:id])
	@question.update(params[:question])
	redirect to '/questions/' + current_user.id.to_s
end