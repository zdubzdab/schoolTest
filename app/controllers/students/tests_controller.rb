class Students::TestsController < ApplicationController

  def index
    @test_setting = TestSetting.find(params[:test_setting_id])
    @questions = @test_setting.questions
    tests_belongs_to_test_setting = Test.where(test_setting_id: @test_setting.id)
    @attempts_number = tests_belongs_to_test_setting.where(user_id: current_user.id)
    # @tests = current_user.tests
    @test = current_user.tests.last
    @subjects = current_user.subjects
    @true_answers = Answer.current_test(@test.id).current_student(current_user.id).with_true.joins(:answer_setting).where( answer_settings: {rigth: 'true'} )
    @result = @true_answers.count / @questions.count * 100
  end

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
      redirect_to students_test_setting_tests_path
    else
      render 'new'
    end
  end

  private

    def tests_params
      params.require(:test).permit(:test_setting_id, :user_id, answers_attributes: [:id, :rigth, :answer_setting_id, :user_id])
    end
end
