# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { create(:category) }

  describe 'associations' do
    it { should have_many(:test) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
