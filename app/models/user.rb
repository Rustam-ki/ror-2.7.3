class User < ApplicationRecord
  def test_by_level(level)
    tests.level(level)
  end
end
