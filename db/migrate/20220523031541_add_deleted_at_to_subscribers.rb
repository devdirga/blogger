class AddDeletedAtToSubscribers < ActiveRecord::Migration[7.0]
  def change
    add_column :subscribers, :deleted_at, :datetime
    add_index :subscribers, :deleted_at
  end
end
