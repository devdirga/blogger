module Api
  module V1
    module Author
      module Entities
        class Author < Grape::Entity
          expose :id
          expose :name
          expose :email
          expose :phone
          expose :avatar
        end
      end
    end
  end
end