module Api
  module V1
    module Article
      module Params
        module Article
          extend Grape::API::Helpers
          params :article_params do
            requires :title, type: String
            requires :author, type: String
          end
        end
      end
    end
  end
end