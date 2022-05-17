class Subscription < ApplicationRecord
  belongs_to :author
  belongs_to :subscriber
end