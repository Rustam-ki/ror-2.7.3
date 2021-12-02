class AddForeignKeysToUserTests < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :user_performed_tests, :users
    add_foreign_key :user_performed_tests, :tests
  end
end
