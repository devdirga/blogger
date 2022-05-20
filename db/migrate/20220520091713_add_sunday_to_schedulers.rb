class AddSundayToSchedulers < ActiveRecord::Migration[7.0]
  def change
    add_column :schedulers, :sunday, :boolean
    add_column :schedulers, :monday, :boolean
    add_column :schedulers, :tuesday, :boolean
    add_column :schedulers, :wednesday, :boolean
    add_column :schedulers, :thursday, :boolean
    add_column :schedulers, :friday, :boolean
    add_column :schedulers, :saturday, :boolean
  end
end
