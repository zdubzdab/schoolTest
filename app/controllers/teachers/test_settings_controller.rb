class Teachers::TestSettingsController < ApplicationController
  load_and_authorize_resource except: :create
  include ApplicationHelper
  layout 'application'

  def index
    @test_settings = TestSetting.order("created_at DESC").page(params[:page]).per(TestSetting::TEACHER_TESTSETTING_INDEX_PAGES)
    respond_to do |format|
      format.html { render partial: "test_setting" if request.xhr? }
    end
  end

  def new
    subject = params.fetch(:subject_id, "")
    categgory = params.fetch(:categgory_id, "")
    theme = params.fetch(:theme_id, "")
    @test_setting = TestSetting.new(subject_id: subject.try(:id), categgory_id: categgory.try(:id), theme_id: theme.try(:id))
    question = @test_setting.questions.build
    3.times { question.answer_settings.build }
  end

  def create
    @test_setting = TestSetting.new(test_settings_params)

    if @test_setting.save
      redirect_to [:teachers, :test_settings], notice: t('.controllers.successfull')
    else
      render "new"
    end

  end

  def search_test_settings
    theme_id = params[:test].try(:[], :theme_id)
    @test_settings = TestSetting.with_theme( params[:test].try(:[], :theme_id) )
    view_context.merge_filter_session_params({class_calles: 'theme', calles_value: theme_id }) unless theme_id.blank?
    if @test_settings.blank?
      render partial: 'record_not_found', layout: false
    else
      render partial: 'search_test_settings', layout: false
    end
  end

  def edit
    @test_settings = TestSetting.find(params[:id])
  end

  def edit
    @test_settings = TestSetting.find(params[:id])
  end

  def update
    if @test_settings.update(test_settings_params)
      redirect_to teachers_test_settings_path
    else
      render 'edit'
    end
  end

  def destroy
    @test_setting = TestSetting.find(params[:id])

    respond_to do |format|
      if @test_setting.destroy
        format.js { render nothing: true }
      else
        format.html { redirect_to teachers_test_settings_path, notice: t('.controllers.error') }
      end
    end
  end

  private
    def test_settings_params
      params.require(:test_setting).permit( :categgory_id, :subject_id, :theme_id, :name, :description, :time_to_pass, :max_tried_count, {videos: []}, {files: []}, questions_attributes: [:text, :id,  :_destroy, answer_settings_attributes: [:name, :id, :rigth, :_destroy]] )
    end
end
