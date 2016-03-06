class AddPrimaryToTidings < ActiveRecord::Migration
  def change
    add_column :tidings, :primary, :boolean
  end
end
