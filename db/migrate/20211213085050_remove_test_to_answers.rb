class RemoveTestToAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :answers, :test, index: true
  end
end
