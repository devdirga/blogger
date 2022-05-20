class RemoveSunFromSchedulers < ActiveRecord::Migration[7.0]
  def change
    remove_column :schedulers, :sun, :boolean
    remove_column :schedulers, :mon, :boolean
    remove_column :schedulers, :tue, :boolean
    remove_column :schedulers, :wed, :boolean
    remove_column :schedulers, :thu, :boolean
    remove_column :schedulers, :fri, :boolean
    remove_column :schedulers, :sat, :boolean
  end
end
