module Api
  module V1
    module Article
      class Routes < Grape::API
        helpers Api::V1::Article::Params::Article
        version 'v1', using: :path
        format :json
        prefix :api
        mount Api::V1::Article::Resources::Article
        mount Api::V1::Article::Entities::Article
        mount Api::V1::Article::Params::Article
      end
    end
  end
end