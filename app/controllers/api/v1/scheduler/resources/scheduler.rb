class Api::V1::Scheduler::Resources::Scheduler < Grape::API
  resource :scheduler do
    get do
      present Scheduler.all, with: Api::V1::Scheduler::Entities::Scheduler
    end
    post do
      Scheduler.create(params)
    end
    put do
      scheduler = Scheduler.find(params[:id])
      scheduler.update(params)
    end
  end
end