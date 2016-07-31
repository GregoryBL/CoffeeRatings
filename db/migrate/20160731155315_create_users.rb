class CreateUsers < ActiveRecord::Migration 
  def change 
    create_table :users do |t|
      t.string :name { null: false, limit: 64 }

      t.timestamps
  end 
end