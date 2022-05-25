module Api
  module V1
    module Tag
      module Entities
        class Tag < Grape::Entity
          expose :id
          expose :title
          expose :description
        end
      end
    end
  end
end