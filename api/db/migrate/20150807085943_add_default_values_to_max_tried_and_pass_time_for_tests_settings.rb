class AddDefaultValuesToMaxTriedAndPassTimeForTestsSettings < ActiveRecord::Migration
  def change
    change_column :test_settings, :time_to_pass, :integer, default: 0
    change_column :test_settings, :max_tried_count, :integer, default: 0
  end
end
