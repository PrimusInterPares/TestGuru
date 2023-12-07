# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserBadge, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:badge).class_name('Badge') }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:badge_id) }
  end
end
