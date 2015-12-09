class AddVideoToTestSetting < ActiveRecord::Migration
  def change
    add_column :test_settings, :video, :string
  end
end
