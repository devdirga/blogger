module Api
  module V1
    module Scheduler
      module Params
        module Scheduler
          extend Grape::API::Helpers
          params :scheduler_params do
            requires :clock, type: String
            requires :sunday, type: Boolean
            requires :monday, type: Boolean
            requires :tuesday, type: Boolean
            requires :wednesday, type: Boolean
            requires :thursday, type: Boolean
            requires :friday, type: Boolean
            requires :saturday, type: Boolean
          end
        end
      end
    end
  end
end