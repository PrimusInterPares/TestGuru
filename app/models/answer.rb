class Answer < ApplicationRecord
  belongs_to :question

  validate :validate_max_answers
  scope :correct, -> { where(correct: true) }

  private

  MAX_ANSWERS = 4

  def validate_max_answers
    errors.add(:question) if question.answers.size > MAX_ANSWERS
  end
end
