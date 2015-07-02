# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  company_id :integer
#

class User < ActiveRecord::Base
  belongs_to :company
  has_many :surveys
  has_many :questions, through: :company
end
