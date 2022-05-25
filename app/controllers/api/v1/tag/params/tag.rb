module Api
  module V1
    module Tag
      module Params
        module Tag
          extend Grape::API::Helpers
          params :tag_params do
            requires :title, type: String
            requires :description, type: String
          end
        end
      end
    end
  end
end