class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  SUCCESS_RATIO = 85.freeze

  scope :successful, -> { where('success_rate >= ?', SUCCESS_RATIO) }

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def update_successfull
    update(successfull: true)
  end

  def passed?
    result >= SUCCESS_PERCENT
  end

  def result
    ((self.correct_questions.to_f / test.questions.count.to_f) * 100).to_i
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def current_question_index
    test.questions.index(current_question)
  end



  def percent_of_progress
    (current_question_index.to_f / test.questions.count.to_f * 100).to_i
  end

  def successfull?
    success_rate >= SUCCESS_RATIO
  end

  def success_rate
    (correct_questions.to_f * 100) / (test.questions.size)
  end

  private

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def before_validation_set_current_question
    self.current_question = next_question
  end

end
