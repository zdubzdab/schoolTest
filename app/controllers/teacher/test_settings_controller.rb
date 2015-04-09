class Teacher::TestSettingsController < ApplicationController
  load_and_authorize_resource
  include ApplicationHelper
  layout 'application'

  def index

  end

  def new
    params_for_new_ticket
    # @test_setting = TestSetting.new(subject_id: session[:filter].try(:[], 'subject'))
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
    @test_settings= TestSetting.find(params[:id])
    @test = @test_setting.test
    render '_form'
  end

  private

    def tests_params
      params.require(:test).permit(:klass, :subject, :theme_id)
      # params.require(:test).permit(:stuff_id, :subject, :description, customer_attributes: [:first_name, :last_name, :email, :guest], comments_attributes: [:message, :user_id, :parent_id])

    end
end