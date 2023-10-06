class User < ApplicationRecord
  # returns a list of all Tests that the User passes or has ever passed at this level of difficulty
  def test_by_level(level)
    Test.joins('JOIN passed_tests ON tests.id = passed_tests.test_id')
        .where('passed_tests.user_id = :id AND tests.level = :level', id:, level:)
  end
end
