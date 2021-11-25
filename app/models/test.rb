class Test < ApplicationRecord

  scope :test_names, -> (category_title) { joins(:category)
                                             .where(categories: { title: category_title }) }

  def self.test_names_title(category_title)
    test_names(category_title).order(title: :desc).pluck(:title)
  end
end
