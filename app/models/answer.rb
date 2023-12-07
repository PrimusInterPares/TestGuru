# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, :value, presence: true

  validates :correct, inclusion: [true, false]

  validate :validate_max_answers, on: :create

  scope :correct, -> { where(correct: true) }

  def self.max_answers
    MAX_ANSWERS
  end

  private

  MAX_ANSWERS = 4

  def validate_max_answers
    errors.add(:question) if question.answers.size > MAX_ANSWERS
  end
end
