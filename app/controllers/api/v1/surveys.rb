module API
  module V1
    class Surveys < Grape::API
      include API::V1::Defaults

      resource :surveys do
        desc "Return all surveys"
        get "", root: :surveys do
          Survey.all
        end

        desc "Return a survey"
        params do
          requires :id, type: Integer, desc: "ID of the survey"
        end
        get ":id" do
          Survey.where(id: params[:id]).first!
        end

        desc "Create a survey"
        params do
          requires :customer_id, type: Integer, desc: "Customer Id"
          requires :company_id,  type: Integer, desc: "Company Id"
        end
        post do
          survey = Survey.new
          survey.init params
        end

        desc "Answer a survey"
        params do
          requires :survey_id, type: Integer, desc: "Survey Id"
          requires :answers,   type: Hash,    desc: "Answers"
          requires :user_id,   type: Integer, desc: "User Id"
        end
        put do
          survey = Survey.find params[:survey_id]
          survey.save_answers params
        end
      end
    end
  end
end