class Api::V1::Subscriber::Resources::Subscriber < Grape::API
  resource :subscriber do
    desc "All"
    get do
      present Subscriber.all, with: Api::V1::Subscriber::Entities::Subscriber
    end
    desc "Get One"
    get ":id" do
      Subscriber.find(params[:id])
    end
    desc "Create"
    post do
      Subscriber.create(name: params[:name],email: params[:email],phone: params[:phone])
    end
    desc "Update"
    put do
      subscriber = Subscriber.find(params[:id])
      subscriber.update(name: params[:name],email:params[:email],phone:params[:phone])
    end
    desc "Delete"
    delete do
      subscriber = Subscriber.find(params[:id])
      subscriber.destroy
    end
  end
end