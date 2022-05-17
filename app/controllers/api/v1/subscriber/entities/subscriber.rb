module Api
  module V1
    module Subscriber
      module Entities
        class Subscriber < Grape::Entity
          expose :name
          expose :email
          expose :phone
        end
      end
    end
  end
end