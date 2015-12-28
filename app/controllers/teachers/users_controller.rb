class Teachers::UsersController < ApplicationController

  def show
    @test_setting = TestSetting.find(params[:test_setting_id])
    @user = User.find(params[:id])
    @tests = @test_setting.tests
                          .includes(:user)
                          .where(user_id: @user.id)
                          .order("complete_pers DESC")
                          .page(params[:page])
                          .per(TestSetting::TEACHER_TESTSETTING_SHOW_PAGES)
  end

end
