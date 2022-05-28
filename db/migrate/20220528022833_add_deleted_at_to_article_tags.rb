class AddDeletedAtToArticleTags < ActiveRecord::Migration[7.0]
  def change
    add_column :article_tags, :deleted_at, :datetime
    add_index :article_tags, :deleted_at
  end
end
