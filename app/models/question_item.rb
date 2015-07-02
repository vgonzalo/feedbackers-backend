# == Schema Information
#
# Table name: question_items
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  question_id :integer
#  title       :string(255)
#

class QuestionItem < ActiveRecord::Base
  belongs_to :question
end
