# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Gist, type: :model do
  subject { create(:gist) }

  describe 'associations' do
    it { should belong_to(:question).class_name('Question') }
    it { should belong_to(:author).class_name('User').optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:author_id) }
    it { should validate_presence_of(:question_id) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:github_gist_id) }
    it { should validate_uniqueness_of(:url) }
    it { should validate_uniqueness_of(:github_gist_id) }
  end
end
