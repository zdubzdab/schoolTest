class ChangeFieldRightToCheckedForAnswers < ActiveRecord::Migration
  def change
    rename_column :answers, :rigth, :checked
  end
end
