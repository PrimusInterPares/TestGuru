# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_first_question, on: %i[create update]

  validates :user_id, :test_id, presence: true

  validates :correct_questions, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  TEST_PASSING_SCORE = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def total_correct_questions
    test.questions.count
  end

  def correct_questions_percentage
    self.correct_questions.to_f / total_correct_questions * 100
  end

  def passed?
    correct_questions_percentage >= TEST_PASSING_SCORE
  end

  private

  def set_first_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
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
end
