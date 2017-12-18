class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :quiz_response
      t.references :choice
      t.references :question

      t.timestamps
    end

    add_index :answers, [:quiz_response_id, :choice_id, :question_id], unique: true
  end
end
