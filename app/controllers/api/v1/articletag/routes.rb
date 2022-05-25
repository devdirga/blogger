module Api
  module V1
    module Articletag
      class Routes < Grape::API
        helpers Api::V1::Articletag::Params::Articletag
        version 'v1', using: :path
        format :json
        prefix :api
        mount Api::V1::Articletag::Resources::Articletag
        mount Api::V1::Articletag::Entities::Articletag
        mount Api::V1::Articletag::Params::Articletag
      end
    end
  end
end