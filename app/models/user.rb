class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  validates :name, :surname, presence: true

  validates :email, if: :email_valid?,
                    presence: true,
                    uniqueness: true

  # returns a list of all Tests that the User passes or has ever passed at this level of difficulty
  def test_by_level(level)
    Test.joins(:tests_users)
        .where('tests_users.user_id = :id AND tests.level = :level', id:, level:)
  end

  private

  EMAIL_TEMPLATE = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def email_valid?
    (email =~ EMAIL_TEMPLATE).nil? ? false : true
  end
end
