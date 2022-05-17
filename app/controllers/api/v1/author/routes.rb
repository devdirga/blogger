module Api
  module V1
    module Author
      class Routes < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api
        mount Api::V1::Author::Resources::Author
        # mount Api::V1::Author::Entities::Author
      end
    end
  end
end