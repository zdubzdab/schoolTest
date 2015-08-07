class RemoveKlassIdFromSubjects < ActiveRecord::Migration
  def change
    remove_column :subjects, :klass_id
  end
end
