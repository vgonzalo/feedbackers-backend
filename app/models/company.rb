# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

class Company < ActiveRecord::Base
  has_many :users
  has_many :surveys
  has_many :questions

  def save_questions(params)
    # Add questions
    if params[:questions] && params[:questions].any?
      params[:questions].each do |q|
        question = Question.new
        question.title         = q.title
        question.question_type = q.question_type
        # Add items in questions
        if %w(checkbox select).include?(q.question_type) && q[:question_items].any?
          q[:question_items].each do |i|
            question_item = QuestionItem.create(title: i.title)
            question.question_items << question_item
          end
        end
        questions << question
      end
    end
    save
  end

  def messages
    surveys.pluck(:message).reject(&:empty?)
  end
end
