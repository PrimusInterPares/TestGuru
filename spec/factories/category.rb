# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    title { Faker::String.random.remove("\u0000") }
  end
end
