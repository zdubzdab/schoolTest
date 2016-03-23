class CreateMethodicalWorks < ActiveRecord::Migration
  def change
    create_table :methodical_works do |t|
      t.string :title
      t.text :text
      t.json :photos

      t.timestamps null: false
    end
  end
end
