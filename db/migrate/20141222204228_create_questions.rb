class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.timestamps
      t.references :survey, index: true
      t.string :title
      t.string :question_type
    end
  end
end
