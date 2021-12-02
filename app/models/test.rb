class Test < ApplicationRecord
  belongs_to :category

  has_many :questions
  has_many :user_performed_tests
  has_many :users, through: :user_performed_tests
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  def self.all_with_category_array(category_title)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: {title: category_title})
      .order(title: :desc)
      .pluck(:title)
  end
end
