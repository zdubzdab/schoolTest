class TestsController < ApplicationController
  # before_filter :prepare_params, only: :search_tests
  load_and_authorize_resource

  def index
    
  end

  def search_tests
    @tests = Test.with_theme(params[:test][:theme_id]) rescue nil
    if @tests.blank?
      render partial: 'record_not_found', layout: false
    else
      render partial: 'search_tests', layout: false
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
      # binding.pry
      # {"utf8"=>"✓", "klass"=>"1", "subject"=>"2", "test"=>{"theme_id"=>"2"}
    end
end