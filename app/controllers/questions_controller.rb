class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  private

  def rescue_with_question_not_found
    render t('.question_not_found')
  end
end
