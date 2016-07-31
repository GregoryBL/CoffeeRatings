class CreateRoasters < ActiveRecord::Migration 
  def change 
    create_table :roasters do |t|
      t.string :name, { limit: 64 }
      t.string :city, { limit: 64 }

      t.timestamps
    end
  end 
end