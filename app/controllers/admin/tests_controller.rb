class Admin::TestsController < Admin::BaseController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  before_action :find_test, only: %i[edit destroy show start update]

  def index
    @tests = Test.all
  end

  def create
    @test = current_user.authored_tests.new(test_params)

    if @test.save
      redirect_to [:admin, @test], status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @test.destroy
      redirect_to admin_tests_path, status: :see_other
    else
      render html: 'Test was not deleted'
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @questions = find_test.questions
  end

  def new
    @test = Test.new
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test), status: :see_other
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
