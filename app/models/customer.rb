# == Schema Information
#
# Table name: customers
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  name         :string(255)
#  phone_number :string(255)
#  gender       :string(255)
#

class Customer < ActiveRecord::Base
end
