# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    body        { Faker::String.random.remove!("\u0000") }
    value       { Faker::Number.between(from: 0.0, to: 1.0) }
    correct     { Faker::Boolean.boolean(true_ratio: 0.5) }
    association :question, factory: :question

    factory :correct_answer do
      correct { true }
    end

    factory :incorrect_answer do
      correct { false }
    end
  end
end
