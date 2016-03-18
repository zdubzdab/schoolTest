class AddUserRefToMethodicalWorks < ActiveRecord::Migration
  def change
    add_reference :methodical_works, :user, index: true, foreign_key: true
  end
end
