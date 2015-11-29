class AddFewAnswersToAnswerSettings < ActiveRecord::Migration
  def change
    add_column :answer_settings, :few_answers, :boolean
  end
end
