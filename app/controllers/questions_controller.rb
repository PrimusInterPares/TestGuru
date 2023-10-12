class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  def index; end

  def show
    render inline: 'Question: <%= @question.inspect %>'
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render plain: 'Question was created'
    else
      render plain: 'Question was not created'
    end
  end

  def destroy
    if @question.destroy
      render plain: 'Question was deleted'
    else
      render plain: 'Question was not deleted'
    end
  end

  def new
    @question = Question.new
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
