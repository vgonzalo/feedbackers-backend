ActiveAdmin.register Survey do

  permit_params :user_id, :customer_id, :company_id, :answered, :code

end
