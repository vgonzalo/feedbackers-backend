# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  title         :string(255)
#  question_type :string(255)
#  company_id    :integer
#

class Question < ActiveRecord::Base
  belongs_to :company
  has_many :answers
  has_many :question_items

  default_scope { order(created_at: :asc) }

  def question_types
    %w(quality select checkbox)
  end

  def answer_data
    data = { value: 0, items: [] }
    case question.type
    when 'quality'
      data[:value] = answers.pluck(:value).reduce(:+) / answers.size
    when 'select'
      question_items.each do |i|
        item = { title: i.title, id: i.id, count: 0 }
        item[:count] = answers.where(value: i.id).size
        data[:items] << item
      end
    when 'checkbox'
      question_items.each do |i|
        item = { title: i.title, id: i.id, count: 0 }
        item[:count] = answers.where("items -> '?' = 'true'", i.id).size
        data[:items] << item
      end
    end
    data
  end
end
