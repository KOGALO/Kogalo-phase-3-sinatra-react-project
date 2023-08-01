class InitTables < ActiveRecord::Migration[6.1]
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.timestamps
    end
  end
end
