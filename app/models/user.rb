class User < ApplicationRecord

  has_many :tests, through: :user_performed_tests
  has_many :user_performed_tests, dependent: :destroy
  has_many :created_tests, class_name: "Test", foreign_key: :author_id

  def  current_test_with_level(level_test)
    tests.where(level: level_test)
  end
end
