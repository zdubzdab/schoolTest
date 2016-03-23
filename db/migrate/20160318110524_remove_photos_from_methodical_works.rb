class RemovePhotosFromMethodicalWorks < ActiveRecord::Migration
  def change
    remove_column :methodical_works, :photos, :json
  end
end
