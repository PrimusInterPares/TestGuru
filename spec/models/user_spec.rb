# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  describe 'associations' do
    it { should have_many(:test_passages) }
    it { should have_many(:tests).through(:test_passages) }
    it { should have_many(:user_badges) }
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
end
