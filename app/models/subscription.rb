class Subscription < ApplicationRecord
  acts_as_paranoid
  belongs_to :author
  belongs_to :subscriber
  # has_many :subscriber, class_name: "Subscriber"
  # You may need to provide a foreign_key like this
  # belongs_to :subscriber_including_deleted, class_name: "Subscriber", foreign_key: "subscriber_id", with_deleted: true
end