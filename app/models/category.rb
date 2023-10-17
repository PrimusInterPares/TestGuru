class Category < ApplicationRecord
  has_many :test

  validates :title, presence: true

  default_scope { order(title: :asc) }
end
