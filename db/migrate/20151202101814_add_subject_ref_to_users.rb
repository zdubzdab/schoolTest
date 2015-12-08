class AddSubjectRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :subject, index: true, foreign_key: true
  end
end
