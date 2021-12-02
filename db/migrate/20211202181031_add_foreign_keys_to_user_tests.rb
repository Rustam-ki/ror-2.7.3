class AddForeignKeysToUserTests < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :user_tests, :users
    add_foreign_key :user_tests, :tests
  end
end
