class Admin::GistsController < Admin::BaseController
  before_action :find_gist, only: %i[destroy]

  def index
    @gists = Gist.all
  end

  def destroy
    service = DeleteGistService.new(@gist)
    result = service.call

    if result
      if @gist.destroy
        flash[:success] = t('.gist_successfully_deleted')
        redirect_to admin_gists_path, status: :see_other
      else
        flash[:error] = t('.gist_not_deleted_from_db')
        redirect_to admin_gists_path
      end
    else
      flash[:error] = t('.gist_not_deleted_from_github')
      redirect_to admin_gists_path
    end
  end

  private

  def find_gist
    @gist = Gist.find(params[:id])
  end
end
