module API
  module V1
    
    module Entities

      class QuestionItem < Grape::Entity
        expose :id
        expose :title
      end

      class AnswerData < Grape::Entity
        expose :value
        expose :items
      end

      class Question < Grape::Entity
        expose :id
        expose :title
        expose :question_type
        expose :question_items, using: API::V1::Entities::QuestionItem
        expose :answer_data, using: API::V1::Entities::AnswerData
      end

      class User < Grape::Entity
        expose :id
        expose :name
      end

      class Company < Grape::Entity
        expose :id
        expose :name
        expose :users, using: API::V1::Entities::User
        expose :questions, using: API::V1::Entities::Question
        expose :messages
      end

    end

    class Companies < Grape::API
      include API::V1::Defaults

      resource :companies do
        desc "Return all companies"
        get "", root: :companies do
          companies = Company.all
          present :companies, companies, with: API::V1::Entities::Company
        end

        desc "Return a company"
        params do
          requires :id, type: Integer, desc: "ID of the contact"
        end
        get ":id" do
          Company.find params[:id]
        end

        desc "Create a company"
        params do
          requires :name, type: String, desc: "Company Name"
        end
        post do
          Company.where(name: params[:name]).first_or_create
        end

        desc "Update questions"
        params do
          requires :company_id, type: Integer, desc: "Id of company"
          requires :questions,  type: Array,   desc: "Array of questions"
        end
        put do
          company = Company.find params[:company_id]
          if not company.nil? and params[:questions].size > 0
            company.save_questions params
          end
        end

      end
    end
  end
end