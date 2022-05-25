module Api
  module V1
    module Articletag
      module Entities
        class Articletag < Grape::Entity
          expose :id
          expose :article_id
          expose :tag_id
        end
      end
    end
  end
end