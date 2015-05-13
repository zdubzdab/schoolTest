class Teacher::AnswerSettingsController < ApplicationController
  def new
  end

  def create
    @answer_setting = AnswerSetting.new(answer_setting_params)
    # @answer_setting = @question.answer_settings.create(answer_setting_params)

    if @answer_setting.save
      redirect_to teacher_test_settings_path
    else
      render 'form'
    end
  end


    private

  def answer_setting_params
    params.require(:answer_setting).permit(:name, :question_id)
  end
end
