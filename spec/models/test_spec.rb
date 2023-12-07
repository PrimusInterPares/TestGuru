# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Test, type: :model do
  subject { create(:test) }

  describe 'associations' do
    it { should belong_to(:author).class_name('User').optional }
    it { should belong_to(:category) }
    it { should have_many(:questions).dependent(:destroy) }
    it { should have_many(:test_passages).dependent(:destroy) }
    it { should have_many(:users).through(:test_passages) }
  end

  describe 'validations' do
    it { should validate_presence_of(:author_id) }
    it { should validate_numericality_of(:level) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).scoped_to(:level) }
  end

  describe 'scopes' do
    describe '.sort_by_category' do
      it 'returns tests having category specified' do
        category = create(:category)
        expected_records = create_list(:test, 5, category:)
        actual_scope = Test.sort_by_category(category.title).records

        expect(actual_scope).to eq(expected_records)
      end
    end
    describe '.easy' do
      it 'returns tests having level from 0 to 1' do
        expected_records = create_list(:easy_test, rand(20))
        unexpected_records = create_list(:medium_test, rand(20))
        unexpected_records.push(*create_list(:hard_test, rand(20)))

        actual_scope = Test.easy.records

        expect(actual_scope).to eq(expected_records)
        expect(actual_scope).not_to eq(unexpected_records)
      end
    end
    describe '.medium' do
      it 'returns tests having level from 2 to 4' do
        unexpected_records = create_list(:easy_test, rand(20))
        expected_records = create_list(:medium_test, rand(20))
        unexpected_records.push(*create_list(:hard_test, rand(20)))

        actual_scope = Test.medium.records

        expect(actual_scope).to eq(expected_records)
        expect(actual_scope).not_to eq(unexpected_records)
      end
    end
    describe '.hard' do
      it 'returns tests having level from 5 to infinity' do
        unexpected_records = create_list(:easy_test, rand(20))
        unexpected_records.push(*create_list(:medium_test, rand(20)))
        expected_records = create_list(:hard_test, rand(20))

        actual_scope = Test.hard.records

        expect(actual_scope).to eq(expected_records)
        expect(actual_scope).not_to eq(unexpected_records)
      end
    end
  end

  describe 'methods' do
    describe 'self.tests_by_category' do
      it 'returns an array of tests titles having category specified' do
        expected_category = create(:category, title: 'One')
        unexpected_category = create(:category, title: 'Another')

        expected_records = create_list(:test, 20, category: expected_category).pluck(:title)
        unexpected_records = create_list(:test, 20, category: unexpected_category).pluck(:title)

        actual_scope = Test.tests_by_category(expected_category.title)

        expect(actual_scope).to match_array(expected_records)
        unexpected_records.each do |unexpected_record|
          expect(actual_scope).not_to include(unexpected_record)
        end
      end
    end
  end
end
