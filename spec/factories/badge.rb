# frozen_string_literal: true

FactoryBot.define do
  factory :badge do
    name      { Faker::String.random.remove!("\u0000") }
    image_url { Faker::Internet.url }
    rule      { Faker::String.random.remove!("\u0000") }
    parameter { Faker::Number.number(digits: 2) }
  end
end
