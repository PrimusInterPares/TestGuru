class Admin::AnswersController < Admin::BaseController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_answer_not_found

  before_action :find_answer, only: %i[destroy edit show update]
  before_action :find_question, only: %i[create new]

  def index; end

  def show; end

  def new
    @answer = Answer.new
  end

  def edit; end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to [:admin, @answer], status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to [:admin, @answer], status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @answer.destroy
      redirect_to [:admin, @answer.question]
    else
      render html: 'Answer was not deleted'
    end
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :value, :correct)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def rescue_with_answer_not_found
    render t('.answer_not_found')
  end
end
