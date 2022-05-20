module Api
  module V1
    module Scheduler
      class Routes < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api
        mount Api::V1::Scheduler::Resources::Scheduler
        mount Api::V1::Scheduler::Entities::Scheduler
      end
    end
  end
end