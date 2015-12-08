class RemoveSpecialityFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :speciality, :string
  end
end
