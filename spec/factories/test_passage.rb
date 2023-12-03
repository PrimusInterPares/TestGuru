# frozen_string_literal: true

FactoryBot.define do
  factory :test_passage do
    association :user, factory: :user
    association :test, factory: :test
    association :current_question, factory: :question
    correct_questions { Faker::Number.number(digits: 2) }
  end
end
