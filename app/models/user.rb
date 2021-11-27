class User < ApplicationRecord
  def  all_test(level_test)
    Test.joins("JOIN user_tests ON tests.id = user_tests.test_id")
        .where(level: level_test, user_tests: {user_id: id})
  end
end
