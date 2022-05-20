class CreateSchedulers < ActiveRecord::Migration[7.0]
  def change
    create_table :schedulers do |t|
      t.string :clock
      t.boolean :sun
      t.boolean :mon
      t.boolean :tue
      t.boolean :wed
      t.boolean :thu
      t.boolean :fri
      t.boolean :sat

      t.timestamps
    end
  end
end
