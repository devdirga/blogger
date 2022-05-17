class Api::V1::Subscription::Resources::Subscription < Grape::API
  resource :subscription do
    desc "All"
    get do
      present Subscription.all
    end
    desc "Create"
    post do
      Subscription.create(author_id: params[:author_id],subscriber_id: params[:subscriber_id])
    end
    desc "Delete"
    delete do
      subscription = Subscription.find(params[:id])
      subscription.destroy
    end
  end
end