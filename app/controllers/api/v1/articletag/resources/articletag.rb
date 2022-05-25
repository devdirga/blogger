class Api::V1::Articletag::Resources::Articletag < Grape::API
  helpers Api::V1::Articletag::Params::Articletag
  resource :articletag do
    get do
      present ArticleTag.all, with: Api::V1::Articletag::Entities::Articletag
    end
    post do
      ArticleTag.create(params)
    end
  end
end