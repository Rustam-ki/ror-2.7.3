class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, from: nil, to: 1
      t.integer :category_id, null: false

      t.references :category, null: false, foreign: true
      t.references :user,  null: false, foreign: true
      t.timestamps
    end
  end
end
