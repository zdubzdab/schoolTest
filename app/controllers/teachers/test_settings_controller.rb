class Teachers::TestSettingsController < ApplicationController
  load_and_authorize_resource except: :create
  include ApplicationHelper
  layout 'application'

  def index
    @questions = Question.all
    @test_settings = TestSetting.all
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
      redirect_to [:teachers, :test_settings]
    else
      render "_form"
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
    @test = @test_setting.test
    render '_form'
  end

  private
    def test_settings_params
      params.require(:test_setting).permit( :categgory_id, :subject_id, :theme_id, :name, :description, :time_to_pass, :max_tried_count, :video, questions_attributes: [:text, :id,  :_destroy, answer_settings_attributes: [:name, :id, :rigth, :_destroy]] )
    end
end
