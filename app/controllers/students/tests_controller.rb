class Students::TestsController < ApplicationController

  def index
    @test_setting = TestSetting.find(params[:test_setting_id])
    @questions = @test_setting.questions
    tests_belongs_to_test_setting = Test.where(test_setting_id: @test_setting.id)
    @attempts_number = tests_belongs_to_test_setting.where(user_id: current_user.id)
    @test = current_user.tests.last
  end

  def new
    @test = Test.new(user_id: current_user.id)
    @test_setting = TestSetting.find(params[:test_setting_id])

    @test_setting.questions.each do |question|
      question.answer_settings.each do |answer_setting|
        @test.answers.build(
          answer_setting_id: answer_setting.id,
          user_id: current_user.id
          )
      end
    end
  end

  def create
    @test_setting = TestSetting.find(params[:test_setting_id])
    @test = @test_setting.tests.new(tests_params)

    if @test.save
      redirect_to students_test_setting_tests_path, notice: t('.controllers.successfull')
    else
      render 'new'
    end
  end

  def show
    @test_setting = TestSetting.find(params[:id])
  end


  private

    def tests_params
      params.require(:test).permit(:test_setting_id, :user_id, answers_attributes: [:id, :checked, :answer_setting_id, :user_id])
    end
end
