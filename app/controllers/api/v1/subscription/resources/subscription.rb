class Api::V1::Subscription::Resources::Subscription < Grape::API
  resource :subscription do
    desc "All"
    get do
      present Subscription.all, with: Api::V1::Subscription::Entities::Subscription
    end
    desc "Create"
    post do
      puts "Create subscription..."
      Subscription.create(params)
    end
    desc "Delete"
    delete do
      subscription = Subscription.find(params[:id])
      subscription.destroy
    end
  end
end