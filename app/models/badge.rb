class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, :description, :rule, presence: true
  validates :title, uniqueness: true

  TYPE_BADGES = %w[cool? madness? category? passed_tests_of_level?].freeze
end