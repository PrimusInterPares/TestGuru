# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { create(:question) }

  describe 'associations' do
    it { should belong_to(:test) }
    it { should have_many(:answers) }
    it { should have_many(:gists).class_name('Gist') }
  end

  describe 'validations' do
    it { should validate_presence_of(:body) }
  end
end
