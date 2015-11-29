class AddTestSettingIdToTests < ActiveRecord::Migration
  def change
    add_column :tests, :test_setting_id, :integer
  end
end
