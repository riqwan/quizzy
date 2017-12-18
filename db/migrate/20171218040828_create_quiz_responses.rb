class CreateQuizResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :quiz_responses do |t|
      t.references :quiz
      t.references :user

      t.timestamps
    end

    add_index :quiz_responses, [:user_id, :quiz_id], unique: true
  end
end
