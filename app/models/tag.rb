class Tag < ApplicationRecord
  acts_as_paranoid
  validates_as_paranoid
  validates_uniqueness_of_without_deleted :title
  has_many :article_tags, dependent: :destroy
  before_save :reform_title

  def reform_title
    self.title = title.tr_s(" ","-")
  end
end
