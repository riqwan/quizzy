class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      t.references :question
      t.string :text
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
