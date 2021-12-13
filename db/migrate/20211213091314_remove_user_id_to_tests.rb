class RemoveUserIdToTests < ActiveRecord::Migration[6.1]
  def change
    remove_reference :tests, :user, index: true, foreign_key: true
  end
end
