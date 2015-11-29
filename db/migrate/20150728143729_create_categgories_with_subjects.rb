class CreateCateggoriesWithSubjects < ActiveRecord::Migration
  def change
    create_table :categgories_with_subjects do |t|
      t.integer :user_id
      t.integer :subject_id
      t.integer :categgory_id
    end

    add_index :categgories_with_subjects, :user_id
    add_index :categgories_with_subjects, :subject_id
    add_index :categgories_with_subjects, :categgory_id
  end
end
