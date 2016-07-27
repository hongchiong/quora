get '/questions/:question_id/answers/new' do
	@question_id = params[:question_id]
	erb :'answers/new'
end

post '/questions/:question_id/answers' do
	if logged_in?
		@answer = Answer.create(user_id: current_user.id, question_id: params[:question_id], body: params[:answer])
		redirect to '/questions/' + params[:question_id] + '/answers/show'
	else
		erb :'session/new'
	end
end

get '/questions/:question_id/answers/show' do
	@question_id = params[:question_id]
	@question = Question.find_by(id: params[:question_id])
	@question = @question.body
	@answers = Answer.where(question_id: params[:question_id])
	erb :'answers/show'
end

get '/answers/:user_id' do
	# @question = Question.find(params[:user_id])
	@answer = Question.where(user_id: params[:id])
	erb :'questions/show'
end