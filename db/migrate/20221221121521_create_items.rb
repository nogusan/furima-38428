class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.references :user, null: false, foreign_key: true
      t.string :item_name , null: false
      t.text :content , null: false
      t.integer :price , null: false
      t.integer :categoly_id , null: false
      t.integer :status_id , null: false
      t.integer :payer_id , null: false
      t.integer :delivery_id , null: false
      t.integer :place_id , null: false 
      t.timestamps
    end
  end
end