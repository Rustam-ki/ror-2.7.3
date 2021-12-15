class DropTableUserPerformedTest < ActiveRecord::Migration[6.1]
  def up
    drop_table :user_performed_tests, if_exists: true
  end
end
