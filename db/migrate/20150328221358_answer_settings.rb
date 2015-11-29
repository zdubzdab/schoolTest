class AnswerSettings < ActiveRecord::Migration
  def change
    create_table :answer_settings do |t|
      t.integer :question_id
      t.boolean :rigth
      t.string :name
    end
  end
end
