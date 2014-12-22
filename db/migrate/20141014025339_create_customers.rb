class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.timestamps
      t.string :name
      t.string :phone_number, index: true
      t.string :gender
    end
  end
end
