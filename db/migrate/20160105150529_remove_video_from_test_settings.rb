class RemoveVideoFromTestSettings < ActiveRecord::Migration
  def change
    remove_column :test_settings, :video, :string
  end
end
