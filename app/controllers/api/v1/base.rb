module Api
  module V1
    class Base < Grape::API
      mount Api::V1::Author::Routes
      mount Api::V1::Subscriber::Routes
      mount Api::V1::Article::Routes
      mount Api::V1::Subscription::Routes
      mount Api::V1::Scheduler::Routes
    end
  end
end