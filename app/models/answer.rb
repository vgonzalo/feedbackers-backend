# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  question_id :integer
#  value       :integer
#  items       :hstore
#  survey_id   :integer
#

class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :survey

end
