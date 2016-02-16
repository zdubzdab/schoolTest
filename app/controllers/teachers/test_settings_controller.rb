class Teachers::TestSettingsController < ApplicationController
  load_and_authorize_resource except: :create
  layout 'application'
  include TestSettingsHelper

  def index
    @test_settings = TestSetting.for_current_teacher(current_user.id)
                                .order("created_at DESC")
                                .page(params[:page])
                                .per(TestSetting::TEACHER_TESTSETTING_INDEX_PAGES)
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

  def show
    @test_setting = TestSetting.find(params[:id])
    @users = @test_setting.users.group_by{ |u| [u.full_name, u.categgory.try(:name), result(u.tests), u.id] }
    @questions = @test_setting.questions
  end

  def edit
    @test_setting = TestSetting.find(params[:id])
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
      params.require(:test_setting).permit(:user_id, :categgory_id, :subject_id, :theme_id, :name, :description, :time_to_pass, :max_tried_count, {videos: []}, {files: []}, questions_attributes: [:text, :id,  :_destroy, answer_settings_attributes: [:name, :id, :rigth, :_destroy]] )
    end

end
