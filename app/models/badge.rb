class Badge < ApplicationRecord
  RULES = [['Пройдены все тесты категории', 'all_tests_of_category_completed'],
           ['Тест пройден с первой попытки', 'success_on_first_try'],
           ['Пройдены все тесты уровня', 'all_tests_of_level_completed']].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, presence: true
end
