class AddBlastToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :blast, :boolean, default: false
  end
end
