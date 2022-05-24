class Api::V1::Author::Resources::Author < Grape::API
  helpers Api::V1::Author::Params::Author
  resource :author do
    desc "All"
    get do
      present Author.all.order(id: :asc), with: Api::V1::Author::Entities::Author
    end
    desc "Get One"
    get ":id" do
      Author.find(params[:id])
    end
    desc "Create"
    params do
      use :author_params
    end
    post do
      Author.create(params)
    end
    desc "Update"
    put do
      author = Author.find(params[:id])
      author.avatar = params[:file]
      author.save!
    end
    desc "Delete"
    delete do
      Author.find(params[:id]).destroy
    end
  end
end