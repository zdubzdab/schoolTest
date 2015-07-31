class AddCattegoryAndSubjectRelationToTestSettings < ActiveRecord::Migration
  def change
    rename_column :test_settings, :klass_id, :categgory_id
  end
end
