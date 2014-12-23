class AddSurveyToAnswer < ActiveRecord::Migration
  def change
    add_reference :answers, :survey, index: true
  end
end
