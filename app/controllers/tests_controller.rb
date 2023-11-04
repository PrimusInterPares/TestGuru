class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  before_action :find_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    if no_questions?
      flash[:alert] = t('.cannot_start_test')
      redirect_to tests_path
    else
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test), status: :see_other, notice: t('.test_started')
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def no_questions?
    @test.questions.count.zero? || @test.questions.count.nil?
  end

  def rescue_with_test_not_found
    render t('.test_not_found')
  end
end
