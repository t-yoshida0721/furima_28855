class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :picture,  null:false 
      t.string :product_name,  null:false
      t.text :product_description,  null:false
      t.integer :product_category,  null:false
      t.integer :Product_status ,  null:false
      t.integer :burden,  null:false
      t.integer :area ,  null:false
      t.integer :days,  null:false
      t.integer :selling_prise,  null:false
      t.timestamps
    end
  end
end
