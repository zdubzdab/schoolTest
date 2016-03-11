class Admin::TidingsController < AdminController
  load_and_authorize_resource

  def new
    @tiding = Tiding.new
    @tiding.images.build
  end

  def create
    @tiding = Tiding.new(tiding_params)

      if @tiding.save
        redirect_to root_path
      else
        render "new"
      end
  end

  def index
    @tidings = Tiding.all.order("created_at DESC").page(params[:page]).per(User::ADMIN_TIDINGS_INDEX_PAGES)
      respond_to do |format|
        format.html { render partial: "tidings" if request.xhr? }
      end
  end

  def edit
    @tiding = Tiding.find(params[:id])
  end

  def update
    @tiding = Tiding.find(params[:id])

    if @tiding.update(tiding_params)
      redirect_to admin_tidings_path
    else
      render 'edit'
    end
  end

  def destroy
    @tiding = Tiding.find(params[:id])

    respond_to do |format|
      if @tiding.destroy
        format.js { render nothing: true }
      else
        format.html { redirect_to admin_tidings_path, notice: t('.controllers.error') }
      end
    end
  end

    private

    def tiding_params
      params.require(:tiding).permit(:id, :text, :title, :main, images_attributes: [:id, :photo, :_destroy, :primary])
    end
end
