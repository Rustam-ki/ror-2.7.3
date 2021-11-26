class Test < ApplicationRecord
  belongs_to :category

  def self.desc_category_title(category_title)
    joins("INNER JOIN categories ON tests.category_id = categories.id").where(categories: {title: category_title}).order(title: :desc).pluck(:title)
  end
end
