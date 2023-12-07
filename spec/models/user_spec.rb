# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  describe 'associations' do
    it { should have_many(:test_passages).dependent(:destroy) }
    it { should have_many(:tests).through(:test_passages) }
    it { should have_many(:user_badges).dependent(:destroy) }
    it { should have_many(:badges).through(:user_badges) }
    it { should have_many(:authored_tests).class_name('Test') }
    it { should have_many(:authored_gists).class_name('Gist') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'methods' do
    describe '.test_by_level' do
      it 'returns a list of all Tests that the User passes or has ever passed at this level of difficulty' do
        user = create(:user)
        level = rand(0..10)
        expected_records = create_list(:test, 20, level:)
        unexpected_records = create_list(:test, 20, level: level + 1)
        Test.all.each do |test|
          create(:test_passage, user:, test:)
        end

        actual_result = user.test_by_level(level)

        expect(actual_result).to match_array(expected_records)
        unexpected_records.each do |unexpected_record|
          expect(actual_result).not_to include(unexpected_record)
        end
      end
    end

    describe '.test_passage' do
      it 'returns the last TestPassage with the Test specified' do
        user = create(:user)
        test = create(:test)
        create(:test_passage, user:, test:)
        test = create(:test)
        unexpected_result = create(:test_passage, user:, test:)
        test = create(:test)
        expected_result = create(:test_passage, user:, test:)
        actual_records = user.test_passage(test)

        expect(actual_records).to eq(expected_result)
        expect(actual_records).not_to eq(unexpected_result)
      end
    end
  end
end
