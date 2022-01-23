class AddCompleteToTests < ActiveRecord::Migration[6.1]
  def change
    def change
      add_column :tests, :completed, :boolean, null: false, default: false
    end
  end
end
