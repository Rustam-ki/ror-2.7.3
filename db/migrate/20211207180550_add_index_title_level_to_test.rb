class AddIndexTitleLevelToTest < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, [:level, :title], name: 'index_level_title_on_test', unique: true
  end
end
