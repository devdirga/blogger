class Subscriber < ApplicationRecord
  acts_as_paranoid
  validates :nik, presence: true, uniqueness: { scope: :nik}
end