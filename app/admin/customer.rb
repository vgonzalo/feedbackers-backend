ActiveAdmin.register Customer do

  permit_params :name, :phone_number, :gender

end
