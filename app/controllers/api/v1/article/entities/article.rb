module Api
  module V1
    module Article
      module Entities
        class Article < Grape::Entity
          expose :id
          expose :title
          expose :body
          expose :author
        end
      end
    end
  end
end