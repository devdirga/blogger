class AddAvatarToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :avatar, :string
  end
end
