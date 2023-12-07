# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { should have_many(:test) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'scopes' do
    describe 'default_scope' do
      it 'returns categories sorted ASC' do
        cat1 = create(:category, title: 'A')
        cat2 = create(:category, title: 'B')
        cat3 = create(:category, title: 'C')
        actual_scope = Category.all

        expect(actual_scope).to eq [cat1, cat2, cat3]
        expect(actual_scope).not_to eq [cat3, cat2, cat1]
        expect(actual_scope).not_to eq [cat1, cat3, cat2]
      end
    end
  end
end
