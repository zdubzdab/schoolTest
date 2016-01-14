class Students::TestsController < ApplicationController

  def new
    @test = Test.new
    @test_setting = TestSetting.find(params[:test_setting_id])
    @test_setting.questions.each do |question|
      question.answer_settings.each do |answer_setting|
        @test.answers.build
      end
    end
    # @test_setting.questions.each do |question|
    #   @test.answers.build
    # end
    # @test_setting.questions.count.times {@test.answers.build}
    # 3.times {@test.answers.build}
    # @test.answers.build
  end

  def create
    @test_setting = TestSetting.find(params[:test_setting_id])
    @test = @test_setting.tests.create(tests_params)

    if @test.save
      redirect_to students_test_settings_path
    else
      render 'new'
    end
  end

  def show
    @test_setting = TestSetting.find(params[:id])
  end


  private

    def tests_params
      params.require(:test).permit(:test_setting_id, :user_id, answers_attributes: [:id, :rigth, :answer_setting_id, :user_id])
    end
end
