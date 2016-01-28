class AddUserRefToTestSettings < ActiveRecord::Migration
  def change
    add_reference :test_settings, :user, index: true, foreign_key: true
  end
end
