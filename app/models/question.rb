class Question < ActiveRecord::Base
  
  belongs_to :survey
  has_many :answers
  has_many :question_items

  def question_types
    ['quality', 'select', 'checkbox']
  end

end
