class RenameNews < ActiveRecord::Migration
  def change
    rename_table :news, :datas
  end
end
