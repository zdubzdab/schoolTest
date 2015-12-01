class RemoveStudentFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :student, :boolean
  end
end
