class CreateUserTests < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tests do |t|
      t.references :user
      t.references :test

      t.timestamps
    end
  end
end
