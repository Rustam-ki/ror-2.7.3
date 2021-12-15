class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :correct, -> { where(correct: true) }

  private

  def count_answers
    errors.add(:question, 'Количество ответов для одного вопроса от 1 до 4') if question.answers.count >= 4
  end
end

