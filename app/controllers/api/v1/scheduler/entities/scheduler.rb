module Api
  module V1
    module Scheduler
      module Entities
        class Scheduler < Grape::Entity
          expose :id
          expose :clock
          expose :sun
          expose :mon
          expose :tue
          expose :wed
          expose :thu
          expose :fri
          expose :sat
        end
      end
    end
  end
end