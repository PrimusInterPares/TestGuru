class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id, optional: true
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :author_id, :ready_to_be_run, presence: true

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
