class RemoveSurveyAndAddCompanyToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :company, index: true
    remove_reference :questions, :survey
  end
end
