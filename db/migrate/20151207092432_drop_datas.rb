class DropDatas < ActiveRecord::Migration
  def change
    drop_table :datas
  end
end
