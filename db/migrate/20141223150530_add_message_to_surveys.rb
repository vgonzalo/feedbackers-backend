class AddMessageToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :message, :text, default: ""
  end
end
