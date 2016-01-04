class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :text
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
