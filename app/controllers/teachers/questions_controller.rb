class Teachers::QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.js
        format.html { redirect_to new_teachers_test_setting_path }
      else
        format.html { render partial: "form" }
        format.js
        end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
      respond_to do |format|
        format.html { redirect_to teachers_test_settings_path }
        format.js  { }
      end
  end

    private

    def question_params
      params.require(:question).permit(:text, :question_id, :id, :answer_setting)
    end
end
