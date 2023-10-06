class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  # returns a descending array of names of all Tests whose Category is named in a certain way
  def self.tests_by_category(category)
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
