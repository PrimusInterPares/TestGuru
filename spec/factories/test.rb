# frozen_string_literal: true

FactoryBot.define do
  factory :test do
    title       { Faker::Superhero.name }
    level       { Faker::Number.digit }
    category
    association :author, factory: :user
    ready_to_be_run { Faker::Boolean.boolean(true_ratio: 0.5) }

    factory :ready_to_be_run_test do
      ready_to_be_run { true }
    end

    factory :not_ready_to_be_run_test do
      ready_to_be_run { false }
    end
  end
end
