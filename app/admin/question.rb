ActiveAdmin.register Question do

  permit_params :question_type, :title, :survey_id

end
