class Api::V1::Subscriber::Resources::Subscriber < Grape::API
  helpers Api::V1::Subscriber::Params::Subscriber
  resource :subscriber do
    get do
      present Subscriber.all, with: Api::V1::Subscriber::Entities::Subscriber
    end
    get ":id" do
      Subscriber.find(params[:id])
    end
    params do
      use :subscriber_params
    end
    post do
      subscriber = Subscriber.create(params)
      if (subscriber.id.present?)
        { data: subscriber}
      else
        { status_code: 305}
      end
    end
    params do
      use :subscriber_params
    end
    put do
      Subscriber.find(params[:id]).update(params)
    end
    delete do
      subscriber = Subscriber.find(params[:id])
      Subscription.where("subscriber_id = #{subscriber.id}").each do |subscription|
        subscription.destroy
      end
      subscriber.destroy
    end
  end
end