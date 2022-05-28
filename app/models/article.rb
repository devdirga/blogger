class Article < ApplicationRecord
  belongs_to :author
  validates :body, presence: true, length: {minimum: 10}

  acts_as_paranoid
  validates_as_paranoid
  validates_uniqueness_of_without_deleted :title

  has_many :article_tags, dependent: :destroy
end