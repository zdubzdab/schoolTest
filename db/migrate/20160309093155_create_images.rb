class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.boolean :primary
      t.json :photos

      t.timestamps null: false
    end
  end
end
