class RenameTestsToTestSettings < ActiveRecord::Migration
  def change
    rename_table :tests, :test_settings
  end
end
