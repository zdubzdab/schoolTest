class AddKlassIdToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :klass_id, :integer
  end
end
