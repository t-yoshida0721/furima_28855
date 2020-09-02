class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.string :product_name,  null:false
      t.text :product_description,  null:false
      t.integer :product_category_id,  null:false
      t.integer :Product_status_id ,  null:false
      t.integer :burden_id,  null:false
      t.integer :area_id ,  null:false
      t.integer :days_id,  null:false
      t.integer :selling_prise,  null:false
      t.references :user, null:false, foreign_key: true 
      t.timestamps
    end
  end
end
