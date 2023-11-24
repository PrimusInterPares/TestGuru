class Admin::TestsController < Admin::BaseController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  before_action :find_test, only: %i[edit destroy show update]

  def index
    @tests = Test.all
  end

  def create
    @test = current_user.authored_tests.new(test_params)

    if @test.save
      redirect_to [:admin, @test], status: :see_other, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @test.destroy
      redirect_to admin_tests_path, status: :see_other, notice: t('.success')
    else
      render t('.failure')
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], status: :see_other, notice: t('.success')
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

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :ready_to_be_run)
  end

  def rescue_with_test_not_found
    render t('.test_not_found')
  end
end
