class Subscriber < ApplicationRecord
  acts_as_paranoid
  # validates :nik, presence: true, uniqueness: { scope: :nik}
  validates_as_paranoid
  validates_uniqueness_of_without_deleted :nik , :phone , :email
  # has_many :subscription, class_name: "Subscription"
end