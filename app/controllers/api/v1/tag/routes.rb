module Api
  module V1
    module Tag
      class Routes < Grape::API
        helpers Api::V1::Tag::Params::Tag
        version 'v1', using: :path
        format :json
        prefix :api
        mount Api::V1::Tag::Resources::Tag
        mount Api::V1::Tag::Entities::Tag
        mount Api::V1::Tag::Params::Tag
      end
    end
  end
end