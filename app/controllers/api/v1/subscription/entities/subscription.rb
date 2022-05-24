module Api
  module V1
    module Subscription
      module Entities
        class Subscription < Grape::Entity
          expose :author_id
          expose :subscriber_id
        end
      end
    end
  end
end