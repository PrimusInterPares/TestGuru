# frozen_string_literal: true

FactoryBot.define do
  factory :user_badge do
    association :user, factory: :user
    association :badge, factory: :badge
  end
end
