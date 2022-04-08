class AddResultToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :success_rate, :integer, default: 0
    add_column :test_passages, :successfull, :boolean, default: false
  end
end
