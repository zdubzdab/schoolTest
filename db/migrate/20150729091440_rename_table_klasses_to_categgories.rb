class RenameTableKlassesToCateggories < ActiveRecord::Migration
  def change
    rename_table :klasses, :categgories
  end
end
