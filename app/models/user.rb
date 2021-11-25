class User < ApplicationRecord
  def test_by_level(level)
    Test.find_by(level: level)
  end
end
