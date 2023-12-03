# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name     { Faker::Name.first_name }
    surname  { Faker::Name.last_name }
    password { Faker::Internet.password }
    email    { Faker::Internet.email }
    type     { 'User' }
  end
end
