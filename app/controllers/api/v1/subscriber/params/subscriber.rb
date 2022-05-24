module Api
  module V1
    module Subscriber
      module Params
        module Subscriber
          extend Grape::API::Helpers
          params :subscriber_params do
            requires :nik, type: String, checknik:true
            requires :name, type: String
            requires :email, type: String
            requires :phone, type: String, checkphone:true
          end
        end
      end
    end
  end
end