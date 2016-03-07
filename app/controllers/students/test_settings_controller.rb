class Students::TestSettingsController < ApplicationController
  include DownloadFromMega

  def index
    @subjects = current_user.subjects
    @themes = Theme.all
  end

  def search_test_settings
    theme = Theme.find_by name: params[:key]
    @test_setting = TestSetting.with_theme( theme.id )
    if @test_setting.blank?
      render partial: 'there_is_not_test', layout: false
    else
      render partial: 'test_settings', layout: false
    end
  end

  def show
    @test_setting = TestSetting.find(params[:id])
    tests_belongs_to_test_setting = Test.where(test_setting_id: @test_setting.id)
    @attempts_number = tests_belongs_to_test_setting.where(user_id: current_user.id)
  end

  private

    def test_setting_params
      params.require(:test_setting).permit(:id, :name)
    end
end
