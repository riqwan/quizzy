class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.references :quiz
      t.string :text

      t.timestamps
    end
  end
end
