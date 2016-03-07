class AddVideosToTestSettings < ActiveRecord::Migration
  def change
    add_column :test_settings, :videos, :json
  end
end
