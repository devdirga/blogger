class Api::V1::Subscriber::Resources::Subscriber < Grape::API
  helpers Api::V1::Subscriber::Params::Subscriber
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
    desc "Update"
    params do
      use :subscriber_params
    end
    put do
      Subscriber.find(params[:id]).update(params)
    end
    desc "Delete"
    delete do
      subscriber = Subscriber.find(params[:id])
      Subscription.where("subscriber_id = #{subscriber.id}").each do |subscription|
        subscription.destroy
      end
      soft_del_subscriber = subscriber.destroy
      if (soft_del_subscriber.present?)
        User.create(nik:subscriber.nik, name:subscriber.name, email:subscriber.email, phone:subscriber.phone)
      end
    end
  end
end