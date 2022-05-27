class Api::V1::Subscription::Resources::Subscription < Grape::API
  resource :subscription do
    get do
      present Subscription.all, with: Api::V1::Subscription::Entities::Subscription
    end
    post do
      Subscription.create(params)
    end
    delete do
      Subscription.find(params[:id]).destroy
    end
  end
end