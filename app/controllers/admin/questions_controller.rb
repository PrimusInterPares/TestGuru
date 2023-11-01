class Admin::QuestionsController < Admin::BaseController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[destroy edit show update]

  def index; end

  def show; end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to [:admin, @question], status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @question.destroy
      redirect_to admin_test_questions_path(test_id: @question.test_id), status: :see_other
    else
      render plain: 'Question was not deleted'
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question], status: :see_other
    else
      render :edit, status: :unprocessable_entity
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
