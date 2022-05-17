class Api::V1::Author::Resources::Author < Grape::API
  resource :author do

    desc "All"
    get do
      present Author.all, with: Api::V1::Author::Entities::Author
    end

    desc "Get One"
    get ":id" do
      Author.find(params[:id])
    end

    desc "Create"
    post do
      Author.create(name: params[:name],email: params[:email],phone: params[:phone])
    end

    desc "Update"
    put do
      author = Author.find(params[:id])
      author.update(name: params[:name],email:params[:email],phone:params[:phone])
    end

    desc "Delete"
    delete do
      author = Author.find(params[:id])
      author.destroy
    end
  end
end