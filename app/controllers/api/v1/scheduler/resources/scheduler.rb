class Api::V1::Scheduler::Resources::Scheduler < Grape::API
  helpers Api::V1::Scheduler::Params::Scheduler
  resource :scheduler do
    get do
      present Scheduler.all, with: Api::V1::Scheduler::Entities::Scheduler
    end
    params do
      use :scheduler_params
    end
    post do
      Scheduler.create(params)
    end
    put do
      Scheduler.find(params[:id]).update(params)
    end
    delete do
      Scheduler.find(params[:id]).destroy
    end
  end
end