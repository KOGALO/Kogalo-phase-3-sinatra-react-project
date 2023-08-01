class HouseToRentTable < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t| 
      t.string :name 
      t.text :address 
      t.integer :price_per_month 
      t.integer :price_to_buy 
      t.timestamps
    end
  end
end
