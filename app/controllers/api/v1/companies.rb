module API
  module V1
    class Companies < Grape::API
      include API::V1::Defaults

      resource :companies do
        desc "Return all companies"
        get "", root: :companies do
          Company.all
        end

        desc "Return a company"
        params do
          requires :id, type: Integer, desc: "ID of the contact"
        end
        get ":id" do
          Contact.where(id: params[:id]).first!
        end

        desc "Create a company"
        params do
          requires :name, type: String, desc: "Company Name"
        end
        post do
          Company.where(name: params[:name]).first_or_create
        end
      end
    end
  end
end