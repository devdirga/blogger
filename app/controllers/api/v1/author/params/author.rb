module Api
  module V1
    module Author
      module Params
        module Author
          extend Grape::API::Helpers
          params :author_params do
            requires :name, type: String
            requires :email, type: String
            requires :phone, type: String
          end
        end
      end
    end
  end
end