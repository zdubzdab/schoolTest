class Students::TestsController < ApplicationController
  load_and_authorize_resource

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
      redirect_to students_test_setting_test_path(@test_setting.id, @test.id), notice: t('.controllers.successfull')
    else
      render 'new'
    end
  end

  def finish_test
    @test_setting = TestSetting.find(params[:test_setting_id])
    @test = @test_setting.tests.new(tests_params)

    if @test.save
      render json: { url: students_test_setting_test_path(@test_setting.id, @test.id) }
    else
      render 'new'
    end
  end

  def show
    @test_setting = TestSetting.find(params[:test_setting_id])
    @questions = @test_setting.questions
    @current_user_passed_tests = @test_setting.tests
                                    .where(user_id: current_user.id)
    @test = Test.find(params[:id])
  end

  private

    def tests_params
      params.require(:test).permit(:test_setting_id, :user_id, answers_attributes: [:id, :checked, :answer_setting_id, :user_id])
    end
end
