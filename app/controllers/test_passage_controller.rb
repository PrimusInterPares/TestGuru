class TestPassageController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound with: :rescue_with_test_pas_not_found

  before_action :set_test_passage, only: %i[result show update]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage), status: :see_other
    else
      render turbo_stream: turbo_stream.replace(
        'show_answers',
        template: 'test_passage/show',
        layout: false
      )
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def rescue_with_test_pas_not_found
    render plain: 'Test passage was not found'
  end
end
