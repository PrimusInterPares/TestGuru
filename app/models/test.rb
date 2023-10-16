class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :author_id, presence: true

  validates :level, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  validates :title, presence: true,
                    uniqueness: { scope: :level }

  scope :sort_by_category, lambda { |category|
    joins(:category)
      .where(categories: { title: category })
  }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  # returns a descending array of names of all Tests whose Category is named in a certain way
  def self.tests_by_category(category)
    sort_by_category(category)
      .order(title: :desc)
      .pluck(:title)
  end
end
