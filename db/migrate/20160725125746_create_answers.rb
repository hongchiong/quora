class CreateAnswers < ActiveRecord::Migration
	def change
		create_table :answers do |t|
			t.belongs_to :user, index: true
			t.belongs_to :question, index: true
			t.string :body
			t.timestamps
		end 
	end
end
