class AddTestSettingIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :test_setting_id, :integer
  end
end
