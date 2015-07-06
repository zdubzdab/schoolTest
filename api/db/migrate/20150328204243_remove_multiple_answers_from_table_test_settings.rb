class RemoveMultipleAnswersFromTableTestSettings < ActiveRecord::Migration
  def change
    remove_column :test_settings, :multipple_ans
  end
end
