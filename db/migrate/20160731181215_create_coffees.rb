class CreateCoffees < ActiveRecord::Migration 
  def change 
    create_table :coffees do |t|
      t.string :name, { limit: 64 }
      t.string :country, { limit: 64 }
      t.string :farm, { limit: 64 }
      t.date :roast_date
      t.integer :roaster_id

      t.timestamps
    end
  end 
end
