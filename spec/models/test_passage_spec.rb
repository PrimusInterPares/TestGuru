# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TestPassage, type: :model do
  subject { build(:test_passage) } # почему работает только с build?????

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

    end
  end
end
