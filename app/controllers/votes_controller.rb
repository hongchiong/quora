post '/questions/:question_id/upvote' do
	QuestionVote.create(user_id: current_user.id, question_id: params[:question_id], vote: 1)
	redirect to '/users/' + current_user.id.to_s
end

post '/questions/:question_id/downvote' do
	QuestionVote.create(user_id: current_user.id, question_id: params[:question_id], vote: 0)
	redirect to '/users/' + current_user.id.to_s
end

post '/questions/:question_id/answers/:answer_id/upvote' do
	AnswerVote.create(user_id: current_user.id, answer_id: params[:answer_id], vote: 1)
	redirect to '/questions/' + params[:question_id] + '/answers/show'
end

post '/questions/:question_id/answers/:answer_id/downvote' do
	AnswerVote.create(user_id: current_user.id, answer_id: params[:answer_id], vote: 0)
	redirect to '/questions/' + params[:question_id] + '/answers/show'
end