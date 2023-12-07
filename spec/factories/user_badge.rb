# frozen_string_literal: true

FactoryBot.define do
  factory :user_badge do
    user
    badge
  end
end
