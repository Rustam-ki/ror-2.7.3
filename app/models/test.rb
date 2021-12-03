class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  has_many :questions, dependent: :destroy
  has_many :user_performed_tests, dependent: :destroy
  has_many :users, through: :user_performed_tests, dependent: :destroy


  def self.all_with_category_array(category_title)
    joins(:category)
      .where(categories: {title: category_title})
      .order(title: :desc)
      .pluck(:title)
  end
end
