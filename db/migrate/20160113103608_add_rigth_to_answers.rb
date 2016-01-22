class AddRigthToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :rigth, :boolean
  end
end
