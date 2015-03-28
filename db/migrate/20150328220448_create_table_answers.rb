class CreateTableAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :answer_setting_id
    end
  end
end
