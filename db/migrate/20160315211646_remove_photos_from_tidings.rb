class RemovePhotosFromTidings < ActiveRecord::Migration
  def change
    remove_column :tidings, :photos
  end
end
