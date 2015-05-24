class Teacher::TestSettingsController < ApplicationController
  load_and_authorize_resource except: :create
  include ApplicationHelper
  layout 'application'

  def index
    @questions = Question.all
  end

  def new
    @test_setting = TestSetting.new(subject_id: session[:filter].try(:[], 'subject'), klass_id: session[:filter].try(:[], 'klass'), theme_id: session[:filter].try(:[], 'theme'))
  end

  def create
    @test_setting = TestSetting.new(test_settings_params)

    if @test_setting.save
      redirect_to [:teacher, :test_settings]
    else
      render 'form'
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

  def add_question
    @test_setting = TestSetting.new
    @test_setting.questions.build
    render partial: 'question_form', layout: false, locals: {test_setting: @test_setting}
  end

  def edit
    @test_settings = TestSetting.find(params[:id])
    @test = @test_setting.test
    render '_form'
  end

  private
    def test_settings_params
      params.require(:test_setting).permit( :klass_id, :subject_id, :theme_id, :name, :description, :time_to_pass, :max_tried_count, questions_attributes: [:text] )
    end
end