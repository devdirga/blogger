module Api
  module V1
    module Scheduler
      module Entities
        class Scheduler < Grape::Entity
          expose :id
          expose :clock
          expose :sunday
          expose :monday
          expose :tuesday
          expose :wednesday
          expose :thursday
          expose :friday
          expose :saturday
        end
      end
    end
  end
end