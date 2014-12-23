class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.timestamps
      t.references :company, index: true
      t.references :user, index: true
      t.references :customer, index: true
      t.string :code
      t.boolean :answered, default: false
    end
  end
end
