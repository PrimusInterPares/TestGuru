class UserBadge < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :badge, class_name: 'Badge', foreign_key: :badge_id

  validates :user_id, :badge_id, presence: true
end
