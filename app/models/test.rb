class Test < ApplicationRecord
  has_many :questions
  has_one :category
end
