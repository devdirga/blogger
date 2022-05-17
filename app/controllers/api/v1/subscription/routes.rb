module Api
  module V1
    module Subscription
      class Routes < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api
        mount Api::V1::Subscription::Resources::Subscription
      end
    end
  end
end