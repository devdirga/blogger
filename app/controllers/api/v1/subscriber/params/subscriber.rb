module Api
  module V1
    module Subscriber
      module Params
        module Subscriber
          extend Grape::API::Helpers
          params :subscriber_params do
            requires :nik, type: String, values: -> (v) { v.length == 16 && v.start_with?("62")}
            requires :name, type: String
            requires :email, type: String
            requires :phone, type: String
          end
        end
      end
    end
  end
end