class Subscriber < ApplicationRecord
  acts_as_paranoid
  validates_as_paranoid
  validates_uniqueness_of_without_deleted :nik , :phone , :email

  has_many :subscription, dependent: :destroy
end