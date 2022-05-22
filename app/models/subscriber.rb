class Subscriber < ApplicationRecord
  validates :nik, presence: true, uniqueness: { scope: :nik}
end
