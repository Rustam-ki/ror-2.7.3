class User < ApplicationRecord
  def  all_test(level_test)
    Test.joins("INNER JOIN users_test ON test.id = users_test.test_id").where(level: level_test, users_tests: {user_id: id})
  end
end
