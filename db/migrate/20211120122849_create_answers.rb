class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct, null: false, default: false

      t.references :test, null: false, foreign_key: true
      t.timestamps
    end
  end
end
