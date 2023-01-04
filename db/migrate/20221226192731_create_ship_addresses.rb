class CreateShipAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_addresses do |t|

      t.string :post, null: false
      t.string :city, null: false
      t.string :line, null: false
      t.string :build_name
      t.string :tell, null: false
      t.references :order, null: false, foreign_key: true
      t.integer :delivery_id, null: false
      t.timestamps
    end
  end
end
