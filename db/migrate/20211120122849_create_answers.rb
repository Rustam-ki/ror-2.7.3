class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct, from: nil, to: false

      t.references :test, null: false, foreign: true
      t.timestamps
    end
  end
end
