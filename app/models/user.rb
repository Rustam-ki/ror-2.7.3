require 'digest/sha1'

class User < ApplicationRecord

  include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: :author_id

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Invalid email format' }

  has_secure_password

  def current_test_with_level(level_test)
    tests.where(level: level_test)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
