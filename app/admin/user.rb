ActiveAdmin.register User do

  permit_params :name, :company_id
  
end
