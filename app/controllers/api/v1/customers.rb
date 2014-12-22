module API
  module V1
    class Customers < Grape::API
      include API::V1::Defaults

      resource :customers do
        desc "Return all customers"
        get "", root: :customers do
          Customer.all
        end

        desc "Return a customer"
        params do
          requires :id, type: Integer, desc: "ID of the customer"
        end
        get ":id" do
          Customer.where(id: params[:id]).first!
        end

        desc "Create a customer"
        params do
          requires :name, type: String, desc: "Customer Name"
          requires :phone_number, type: String, desc: "Customer Phone Number"
          requires :gender, type: String, desc: "Customer Gender (M or F)"
        end
        post do
          customer = Customer.find_by_phone_number params[:phone_number]
          if customer.nil?
            customer = Customer.create name: params[:name], phone_number: params[:phone_number], gender: params[:gender]
          end
        end
      end
    end
  end
end