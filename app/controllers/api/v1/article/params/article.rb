module Api
  module V1
    module Article
      module Params
        module Article
          extend Grape::API::Helpers
          params :article_params do
            build_with Grape::Extensions::Hash::ParamBuilder
            requires :title, type: String
            requires :author_id, type: Integer
            
            optional :tags, type:Hash do
              optional :id, type: Integer
              optional :title, type: String
              optional :description, type: String
              optional :_destroy, type: Boolean
            end
          end
        end
      end
    end
  end
end