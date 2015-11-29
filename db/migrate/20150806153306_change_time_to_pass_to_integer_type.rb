class ChangeTimeToPassToIntegerType < ActiveRecord::Migration
  def change
    remove_column :test_settings, :time_to_pass
    add_column :test_settings, :time_to_pass, :integer
  end
end
