class RemoveCompletePersFromTestSettingsAddThisForTests < ActiveRecord::Migration
  def change
    remove_column :test_settings, :complete_pers
    add_column :tests, :complete_pers, :integer
  end
end
