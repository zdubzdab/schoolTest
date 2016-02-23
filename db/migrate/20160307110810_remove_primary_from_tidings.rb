class RemovePrimaryFromTidings < ActiveRecord::Migration
  def change
    remove_column :tidings, :primary, :boolean
  end
end
