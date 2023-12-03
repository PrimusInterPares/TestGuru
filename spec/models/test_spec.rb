# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Test, type: :model do
  subject { create(:test) }

  describe 'associations' do
    it { should belong_to(:author).class_name('User').optional }
    it { should belong_to(:category) }
    it { should have_many(:questions) }
    it { should have_many(:test_passages) }
    it { should have_many(:users).through(:test_passages) }
  end

  describe 'validations' do
    it { should validate_presence_of(:author_id) }
    it { should validate_numericality_of(:level) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).scoped_to(:level) }
  end
end
