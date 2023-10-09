class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  # returns a list of all Tests that the User passes or has ever passed at this level of difficulty
  def test_by_level(level)
    Test.joins(:tests_users)
        .where('tests_users.user_id = :id AND tests.level = :level', id:, level:)
  end
end
