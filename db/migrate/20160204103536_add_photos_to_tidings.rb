class AddPhotosToTidings < ActiveRecord::Migration
  def change
    add_column :tidings, :photos, :json
  end
end
