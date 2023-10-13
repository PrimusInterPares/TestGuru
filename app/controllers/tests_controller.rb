class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def create
    @test = Test.new(test_params)
    p @test
    if @test.save
      redirect_to @test
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @test.destroy
      render plain: 'Test was deleted'
    else
      render plain: 'Test was not deleted'
    end
  end

  def edit
    @test = find_test
  end

  def update
    @test = find_test

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    find_test
  end

  def new
    @test = Test.new
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
