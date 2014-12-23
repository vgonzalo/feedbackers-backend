class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.timestamps
      t.references :question, index: true
      t.integer :value
      t.hstore :items, index: true
    end
  end
end
