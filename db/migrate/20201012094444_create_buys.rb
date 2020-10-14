class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.references    :user,                       foregin_key: true
      t.references    :item,                       foregin_key: true
      t.timestamps
    end
  end
end
