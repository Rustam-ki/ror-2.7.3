class User < ApplicationRecord

  has_many :tests, through: :user_performed_tests
  has_many :user_performed_tests, dependent: :delete_all

  def  current_test_with_level(level_test)
    Test.joins(:user_performed_tests)
        .where(level: level_test, user_performed_tests: {user_id: id})
  end
end
