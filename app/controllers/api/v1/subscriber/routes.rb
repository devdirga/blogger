module Api
  module V1
    module Subscriber
      class Routes < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api
        mount Api::V1::Subscriber::Resources::Subscriber
        mount Api::V1::Subscriber::Entities::Subscriber
        mount Api::V1::Subscriber::Params::Subscriber
      end
    end
  end
end