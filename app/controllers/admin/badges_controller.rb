class Admin::BadgesController < Admin::BaseController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_badge_not_found

  before_action :set_badge, only: %i[destroy edit show update]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to [:admin, @badge], status: :see_other, notice: t('.success')
    else
      render t('.failure')
    end
  end

  def destroy
    if @badge.delete
      redirect_to admin_badges_path, status: :see_other, notice: t('.success')
    else
      render t('.failure')
    end
  end

  def edit; end

  def show; end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge], status: :see_other
    else
      render t('.failure')
    end
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :image_url, :rule, :parameter)
  end

  def rescue_with_badge_not_found
    render html: t('badges.badge_not_found')
  end
end
