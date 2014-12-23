class User < ActiveRecord::Base

  belongs_to :company
  has_many :surveys
  has_many :questions, through: :company

end
