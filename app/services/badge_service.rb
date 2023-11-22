# frozen_string_literal: true

class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
    @user_test_passages = @user.test_passages
  end

  def call
    Badge.all.each do |badge|
      @user.badges.push(badge) if send("#{badge.rule}?", badge.parameter)
    end
  end

  private

  def success_on_first_try?(parameter)
    @user_test_passages.where(test_id: @test.id).count == 1
  end

  def all_tests_of_category_completed?(category_id)
    return if category_id.nil? || category_id.empty?

    category = Category.where(id: category_id).pluck(:title)

    user_tests_of_category_given = @user.tests.sort_by_category(category).ids
    tests_of_category_given = Test.sort_by_category(category).ids

    user_tests_of_category_given.sort.uniq == tests_of_category_given.sort.uniq
  end

  def all_tests_of_level_completed?(level)
    return if level.nil? || level.empty?

    tests_of_level_given = Test.where(level: level).ids
    user_tests_of_level_given = @user.tests.where(level: level).ids

    user_tests_of_level_given.sort.uniq == tests_of_level_given.sort.uniq
  end
end
