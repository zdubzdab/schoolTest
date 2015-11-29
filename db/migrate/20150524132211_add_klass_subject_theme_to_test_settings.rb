class AddKlassSubjectThemeToTestSettings < ActiveRecord::Migration
  def change
    add_column :test_settings, :klass_id, :integer
    add_column :test_settings, :subject_id, :integer

    add_index :test_settings, :klass_id
    add_index :test_settings, :subject_id
  end

end
