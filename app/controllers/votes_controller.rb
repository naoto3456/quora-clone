get '/questions/:question_id/votes' do

	current_q_vote = QuestionVote.find_by(question_id: params[:question_id], user_id: current_user.id)

	if current_q_vote.nil?
		q_vote = QuestionVote.new(question_id: params[:question_id], user_id: current_user.id, upvote: 1)

		if q_vote.save
			q_votes = QuestionVote.where("question_id = ? and upvote = ?", params[:question_id], 1)
			return q_votes.to_json 
			#return {vote_count: q_votes.count, command_type: 'C'}
		else
			status 400
			return  q_vote.errors.full_messages.first
		end 
	else
		if current_q_vote.destroy
			q_votes = QuestionVote.where("question_id = ? and upvote = ?", params[:question_id], 1)
			return q_votes.to_json 
		else
			status 400
			return  q_vote.errors.full_messages.first
		end 
	end

end
