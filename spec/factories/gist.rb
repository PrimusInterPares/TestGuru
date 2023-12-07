# frozen_string_literal: true

FactoryBot.define do
  factory :gist do
    question
    association :author, factory: :user
    url            { Faker::Internet.url }
    github_gist_id { Faker::Internet.uuid }
  end
end
