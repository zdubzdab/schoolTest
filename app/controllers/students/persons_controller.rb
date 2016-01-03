class Students::PersonsController < ApplicationController

  def profile
    # @categgories_with_subjects = current_user.categgories_with_subjects
    @subjects = current_user.subjects
    @themes = Theme.all
  end

  def search_test_settings
    # theme_id = params[:test].try(:[], :theme_id)
    # @test_settings = TestSetting.with_theme( params[:test].try(:[], :theme_id) )
    # view_context.merge_filter_session_params({class_calles: 'theme', calles_value: theme_id }) unless theme_id.blank?
    # if @test_settings.blank?
    #   render partial: 'record_not_found', layout: false
    # else
      render partial: 'test_settings', layout: false
    # end
  end

  private
    def user_params
      params.require(:user).permit(:full_name, :email)
    end
end
