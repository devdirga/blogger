class RemoveBlastFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :blast, :boolean
  end
end
