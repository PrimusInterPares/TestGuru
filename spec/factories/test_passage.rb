# frozen_string_literal: true

FactoryBot.define do
  factory :test_passage do
    user
    test
    current_question  { nil }
    correct_questions { Faker::Number.number(digits: 2) }
  end
end
