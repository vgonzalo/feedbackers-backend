class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.timestamps
      t.references :company_id, index: true
      t.references :user_id, index: true
      t.references :customer_id, index: true
      t.string :code
      t.boolean :answered, default: false
    end
  end
end
