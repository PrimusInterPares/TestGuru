class AnswersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_answer_not_found

  private

  def rescue_with_answer_not_found
    render plain: 'Answer was not found'
  end
end
