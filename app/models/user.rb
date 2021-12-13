class User < ApplicationRecord
  def  current_test_with_level(level_test)
    Test.joins("JOIN user_performed_tests ON tests.id = user_performed_tests.test_id")
        .where(level: level_test, user_performed_tests: {user_id: id})
  end
end
