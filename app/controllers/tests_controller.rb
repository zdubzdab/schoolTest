class TestsController < ApplicationController
  # before_filter :prepare_params, only: :search_tests
  load_and_authorize_resource
  include ApplicationHelper

  def new
    # params_for_new_ticket
    @test = Test.new(subject_id: session[:filter].try(:[], 'subject'))
    # binding.pry
  end

  def search_tests
    theme_id = params[:test].try(:[], :theme_id)
    @tests = Test.with_theme( params[:test].try(:[], :theme_id) )
    view_context.merge_filter_session_params({class_calles: 'theme', calles_value: theme_id }) unless theme_id.blank?
    respond_to do |format|
      if @tests.blank?
        format.js {render partial: 'record_not_found', layout: false}
      else
        format.js {render partial: 'search_tests', layout: false}
      end
    end
  end

  def edit
    render partial: 'form'
  end

  private

    def tests_params
      params.require(:test).permit(:klass, :subject, :theme_id)
      # params.require(:test).permit(:stuff_id, :subject, :description, customer_attributes: [:first_name, :last_name, :email, :guest], comments_attributes: [:message, :user_id, :parent_id])

    end

    def prepare_params

    end

end

