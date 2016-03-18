class Teachers::MethodicalWorksController < ApplicationController
  load_and_authorize_resource

  def new
    @methodical_work = MethodicalWork.new
    @methodical_work.images.build
  end

  def create
    @methodical_work = MethodicalWork.new(methodical_work_params)

      if @methodical_work.save
        redirect_to teachers_methodical_works_path, notice: t('.controllers.sucessful')
      else
        render "new"
      end
  end

  def index
    @methodical_works = MethodicalWork.all
                                      .order("created_at DESC")
                                      .page(params[:page])
                                      .per(MethodicalWork::METHODICAL_WORKS_PAGES)
      respond_to do |format|
        format.html { render partial: "methodical_works" if request.xhr? }
      end
  end

  def edit
    @methodical_work = MethodicalWork.find(params[:id])
  end

  def update
    @methodical_work = MethodicalWork.find(params[:id])

    if @methodical_work.update(methodical_work_params)
      redirect_to teachers_methodical_works_path, notice: t('.controllers.sucessful')
    else
      render 'edit'
    end
  end

  def destroy
    @methodical_work = MethodicalWork.find(params[:id])
    if @methodical_work.destroy
      redirect_to teachers_methodical_works_path, notice: t('.controllers.sucessful')
    else
      redirect_to teachers_methodical_works_path, notice: t('.controllers.error')
    end
  end

    private

    def methodical_work_params
      params.require(:methodical_work).permit(:id, :text, :title, :user_id, images_attributes: [:id, :photo, :_destroy, :primary])
    end
end
