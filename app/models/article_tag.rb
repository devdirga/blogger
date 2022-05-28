class ArticleTag < ApplicationRecord
  acts_as_paranoid
  belongs_to :article
  belongs_to :tag
end
