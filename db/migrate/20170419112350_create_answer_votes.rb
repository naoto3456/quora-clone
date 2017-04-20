class CreateAnswerVotes < ActiveRecord::Migration
	def change
			create_table :answer_votes do |t|
			t.integer :answer_id
			t.integer :user_id
			t.integer :upvote
			t.timestamps
		end

	end
end
