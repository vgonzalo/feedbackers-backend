# == Schema Information
#
# Table name: surveys
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  company_id  :integer
#  user_id     :integer
#  customer_id :integer
#  code        :string(255)
#  answered    :boolean          default(FALSE)
#  message     :text             default("")
#

class Survey < ActiveRecord::Base
  require 'securerandom'

  belongs_to :customer
  belongs_to :company
  belongs_to :user

  has_many :answers

  def generate_code
    loop do
      random_code = SecureRandom.random_number(36**12).to_s(36).rjust(10, '0')
      return random_code if Survey.find_by_code(random_code).nil?
    end
  end

  def init(params)
    self.customer = Customer.find params[:customer_id] if params[:customer_id]
    self.company  = Company.find params[:company_id]   if params[:company_id]
    self.code     = generate_code
    self.answered = false
    save
  end

  def save_answers(params)
    self.answered = true
    self.message  = params[:message]
    self.user     = User.find params[:user_id]
    self.answers  = []
    params[:answers].each do |answer|
      answer_params = ActionController::Parameters.new(answer)
      answers << Answer.new(answer_params.permit!)
    end
    save
  end
end
