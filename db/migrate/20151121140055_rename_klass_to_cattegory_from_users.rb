class RenameKlassToCattegoryFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :klass_id
    add_column :users, :categgory_id, :integer
  end
end
