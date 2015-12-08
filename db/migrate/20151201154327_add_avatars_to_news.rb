class AddAvatarsToNews < ActiveRecord::Migration
  def change
    add_column :news, :avatars, :json
  end
end
