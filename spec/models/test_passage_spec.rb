# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TestPassage, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:test) }
    it { should belong_to(:current_question).class_name('Question').optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:test_id) }
    it { should validate_numericality_of(:correct_questions).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'callbacks' do
    describe 'before_validation' do
      describe 'first_question generation on: :create' do
        it 'invokes set_first_question' do
          # Prepare data for TestPassage
          user = create(:user)
          # Test must nave at least 1 question to have it filled after validation
          test = create(:test)
          question = create(:question, test_id: test.id)
          create_list(:question, 5, test_id: test.id)
          # Built (not create) TestPassage object
          test_passage = build(:test_passage, user_id: user.id,
                                              test_id: test.id,
                                              current_question: nil,
                                              correct_questions: 2)

          # Before validation check there is no current_question
          expect(test_passage.current_question.present?).to be(false)

          # Validate object to have current_question set after validation
          expect(test_passage.valid?).to be(true)
          expect(test_passage.current_question.present?).to be(true)

          # Validate current_question set = next question
          expect(test_passage.current_question).to eq(question)
        end
      end
    end
  end
end
