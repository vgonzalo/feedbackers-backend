class Company < ActiveRecord::Base
  
  has_many :users
  has_many :surveys
  has_many :questions

  def save_questions params
    # Add questions
    if not params[:questions].nil? and params[:questions].size > 0
      params[:questions].each do |q|
        question = Question.new
        question.title         = q.title
        question.question_type = q.question_type
        # Add items in questions
        if ['checkbox', 'select'].include? q.question_type and q[:question_items].size > 0
          q[:question_items].each do |i|
            question_item = QuestionItem.new
            question_item.title = i.title
            question.question_items << question_item
          end
        end
        self.questions << question
      end
    end
    self.save
  end

end
