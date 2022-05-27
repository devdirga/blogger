module Api
  module V1
    class Base < Grape::API
      mount Api::V1::Author::Routes
      mount Api::V1::Subscriber::Routes
      mount Api::V1::Article::Routes
      mount Api::V1::Subscription::Routes
      mount Api::V1::Scheduler::Routes
      mount Api::V1::Tag::Routes
      mount Api::V1::Articletag::Routes
      mount Api::V1::Admin::Routes
    end
  end
end