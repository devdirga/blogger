class Api::V1::Tag::Resources::Tag < Grape::API
  helpers Api::V1::Tag::Params::Tag
  resource :tag do
    get do
      present Tag.all, with: Api::V1::Tag::Entities::Tag
    end
    post do
      Tag.create(params)
    end
    put do
      Tag.find(params[:id]).update(params)
    end
    delete do
      Tag.find(params[:id]).destroy
    end
  end
end