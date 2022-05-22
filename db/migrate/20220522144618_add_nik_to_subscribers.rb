class AddNikToSubscribers < ActiveRecord::Migration[7.0]
  def change
    add_column :subscribers, :nik, :string
  end
end
