# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject { create(:answer) }

  describe 'associations' do
    it { should belong_to(:question) }
  end

  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:value) }
    describe 'max_answers limit check on: :create' do
      it 'invokes validate_max_answers' do
        # Prepare data
        question = create(:question)
        # Create answers 1 less than max
        create_list(:answer, Answer.max_answers - 1, question_id: question.id)
        # Built one more which will fill the max after validation
        answer = build(:answer, question:)

        # Validate object when MAX_ANSWERS is not exceeded
        expect(answer.valid?).to be(true)

        # Save answer to "last" slot
        answer.save!
        answer = build(:answer, question:)

        # Validate MAX_ANSWERS is reached
        expect(answer.valid?).to be(false)
      end
    end
  end

  describe 'scopes' do
    describe '.correct' do
      it 'returns answers which have correct = true' do
        expected_records = create_list(:correct_answer, 25)
        unexpected_scope = create_list(:incorrect_answer, 25)
        actual_scope = Answer.correct

        expect(actual_scope).to eq(expected_records)
        expect(actual_scope).not_to eq(unexpected_scope)
      end
    end
  end
end
