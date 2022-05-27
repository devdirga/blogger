class Api::V1::Tag::Resources::Tag < Grape::API
  helpers Api::V1::Tag::Params::Tag
  resource :tag do
    get do
      present Tag.all, with: Api::V1::Tag::Entities::Tag
    end
    post do
      params[:title] = params[:title].tr_s(" ","-")
      Tag.create(params)
    end
    put do
      params[:title] = params[:title].tr_s(" ","-")
      Tag.find(params[:id]).update(params)
    end
    delete do
      Tag.find(params[:id]).destroy
    end
  end
end