class AddReferencesToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_reference :subscriptions, :subscriber, null: false, foreign_key: true
  end
end
