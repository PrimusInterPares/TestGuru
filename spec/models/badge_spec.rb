# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Badge, type: :model do
  subject { create(:badge) }

  describe 'associations' do
    it { should have_many(:user_badges) }
    it { should have_many(:users).through(:user_badges) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
