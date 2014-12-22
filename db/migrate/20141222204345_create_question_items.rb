class CreateQuestionItems < ActiveRecord::Migration
  def change
    create_table :question_items do |t|
      t.timestamps
      t.references :question_id, index: true
      t.string :title
    end
  end
end
