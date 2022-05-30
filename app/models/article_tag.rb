class ArticleTag < ApplicationRecord
  acts_as_paranoid
  belongs_to :article
  belongs_to :tag
  accepts_nested_attributes_for :article
  accepts_nested_attributes_for :tag
end
