class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  before_action :find_test, only: %i[edit destroy show start update]
  before_action :find_user, only: :start

  def index
    @tests = Test.all
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @test.destroy
      redirect_to tests_path, status: :see_other
    else
      render html: 'Test was not deleted'
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

  def new
    @test = Test.new
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test), status: :see_other
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
