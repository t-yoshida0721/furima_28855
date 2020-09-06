class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postcode, null:false
      t.integer :area_id, null:false
      t.string  :city, null:false
      t.string  :block, null:false
      t.string :building 
      t.string :phone_number, null:false
      # t.references :bid, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
