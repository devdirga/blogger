module Api
  module V1
    module Admin
      class Routes < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api
        mount Api::V1::Admin::Resources::Admin
      end
    end
  end
end