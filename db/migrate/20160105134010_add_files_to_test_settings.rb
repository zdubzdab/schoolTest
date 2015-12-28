class AddFilesToTestSettings < ActiveRecord::Migration
  def change
    add_column :test_settings, :files, :json
  end
end
