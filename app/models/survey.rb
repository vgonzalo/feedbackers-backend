class Survey < ActiveRecord::Base

  require 'securerandom'

  belongs_to :customer
  belongs_to :company
  belongs_to :user

  has_many :answers

  def get_code
    random_code = 0
    while true
      random_code = SecureRandom.random_number(36**12).to_s(36).rjust(10, '0')
      return random_code if Survey.find_by_code(random_code).nil?
    end
  end

  def init params
    self.customer = Customer.find params[:customer_id] if not params[:customer_id].nil?
    self.company  = Company.find params[:company_id]   if not params[:company_id].nil?
    self.code     = get_code
    self.answered = false
    self.save
  end

  def save_answers params
    self.answered = true
    self.message  = params[:message]
    self.user     = User.find params[:user_id]
    self.answers  = []
    params[:answers].each do |answer|
      answer_params = ActionController::Parameters.new answer
      self.answers << (Answer.new answer_params.permit!)
    end
    self.save
  end

end
