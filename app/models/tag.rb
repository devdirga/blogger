class Tag < ApplicationRecord
  before_create do
    self.title = title.tr_s(" ","-")
  end
  before_update do
    self.title = title.tr_s(" ","-")
  end
end
