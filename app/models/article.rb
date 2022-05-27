class Article < ApplicationRecord
  belongs_to :author
  validates :body, presence: true, length: {minimum: 10}
end