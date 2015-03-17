class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :complete_pers
      t.integer :max_tried_count
      t.text :description
      t.datetime :time_to_pass
      t.boolean :multipple_ans
      t.integer :theme_id

      t.timestamps null: false
    end
  end
end
