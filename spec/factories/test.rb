# frozen_string_literal: true

FactoryBot.define do
  factory :test do
    title       { Faker::String.random.remove("\u0000") }
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

    factory :easy_test do
      level { rand(0..1) }
    end

    factory :medium_test do
      level { rand(2..4) }
    end

    factory :hard_test do
      level { rand(5..100) }
    end
  end
end
