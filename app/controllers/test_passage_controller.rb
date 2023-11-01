class TestPassageController < ApplicationController
  before_action :set_test_passage, only: %i[result show update]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
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
end
