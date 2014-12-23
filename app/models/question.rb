class Question < ActiveRecord::Base
  
  belongs_to :company
  has_many :answers
  has_many :question_items

  default_scope { order(created_at: :asc) }

  def question_types
    ['quality', 'select', 'checkbox']
  end

  def answer_data
    data = {value: 0, items: []}
    if self.question_type.eql? 'quality'
      data[:value] = self.answers.pluck(:value).reduce(:+) / self.answers.size
    elsif self.question_type.eql? 'select'
      self.question_items.each do |i|
        item = {title: i.title, id: i.id, count: 0}
        item[:count] = self.answers.where(value: i.id).size
        data[:items] << item
      end
    else self.question_type.eql? 'checkbox'
      self.question_items.each do |i|
        item = {title: i.title, id: i.id, count: 0}
        item[:count] = self.answers.where("items -> '?' = 'true'", i.id).size
        data[:items] << item
      end
    end
    data
  end

end
