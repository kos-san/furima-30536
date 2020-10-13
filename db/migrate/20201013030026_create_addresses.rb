class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,    null: false
      t.integer    :area_id,        null: false
      t.string     :city,           null: false
      t.string     :house_num,      null: false
      t.string     :tel,            null: false, default: ""
      t.string     :building
      t.references :buy,            foregin_key: true
      t.timestamps
    end
  end
end
