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
  end
end
