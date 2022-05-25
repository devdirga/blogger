module Api
  module V1
    module Article
      module Params
        module Article
          extend Grape::API::Helpers
          params :article_params do
            requires :title, type: String
            requires :author_id, type: Integer
          end
        end
      end
    end
  end
end