class AddAvatarsToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :avatars, :string
  end
end
