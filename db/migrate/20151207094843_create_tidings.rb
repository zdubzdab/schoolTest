class CreateTidings < ActiveRecord::Migration
  def change
    create_table :tidings do |t|
      t.string :title
      t.text :text
      t.boolean :main

      t.timestamps null: false
    end
  end
end
