class RemoveNameFromTestsAndAddToTestSettings < ActiveRecord::Migration
  def change
    remove_column :tests, :name
    add_column :test_settings, :name, :string
  end
end
