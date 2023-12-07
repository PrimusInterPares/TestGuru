# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    body { Faker::String.random.remove("\u0000") }
    test
  end
end
