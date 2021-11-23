class Test < ApplicationRecord

  belongs_to :category, optional: true

  scope :sort_by_category_title, -> (category_title) { joins(:category).where(categories: { title: category_title })}

  def self.sort_tests_by_title(category_title)
    Test.sort_by_category_title(category_title).order(title: :desc).pluck(:title)
  end
end
