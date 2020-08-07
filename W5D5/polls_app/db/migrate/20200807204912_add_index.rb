class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :username, unique: true
    add_index :polls, :user_id
    add_index :questions, :poll_id
    add_index :answer_choices, :question_id
    add_index :responses, :question_id
  end
end

#https://guides.rubyonrails.org/active_record_querying.html