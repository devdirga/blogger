module Api
  module V1
    module Articletag
      module Params
        module Articletag
          extend Grape::API::Helpers
          params :articletag_params do
            requires :article_id, type: Integer
            requires :tag_id, type: Integer
          end
        end
      end
    end
  end
end