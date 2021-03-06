module API
  module V1
    module Entities
      class Survey < Grape::Entity
        expose :id
        expose :company, using: API::V1::Entities::Company
        expose :customer, using: API::V1::Entities::Customer
        expose :answered
        expose :code
      end
    end

    class Surveys < Grape::API
      include API::V1::Defaults

      resource :surveys do
        desc 'Return all surveys'
        get '', root: :surveys do
          Survey.all
        end

        desc 'Return a survey'
        params do
          requires :id, type: Integer, desc: 'ID of the survey'
        end
        get ':id' do
          Survey.find params[:id]
        end

        desc 'Return a survey using a code'
        params do
          requires :code, type: String, desc: 'Code of the survey'
        end
        get '/code/:code' do
          survey = Survey.find_by_code params[:code]
          if survey.nil?
            { message: 'There is no survey in this page' }
          elsif survey.answered
            { message: 'This survey has been completed' }
          else
            present :survey, survey, with: API::V1::Entities::Survey
          end
        end

        desc 'Create a survey'
        params do
          requires :customer_id, type: Integer, desc: 'Customer Id'
          requires :company_id,  type: Integer, desc: 'Company Id'
        end
        post do
          survey = Survey.new
          survey.init params
        end

        desc 'Answer a survey'
        params do
          requires :id,      type: Integer, desc: 'Survey Id'
          requires :answers, type: Array,   desc: 'Answers'
          requires :user_id, type: Integer, desc: 'User Id'
          requires :message, type: String,  desc: 'Message'
        end
        put do
          survey = Survey.find params[:id]
          survey.save_answers params
        end
      end
    end
  end
end
