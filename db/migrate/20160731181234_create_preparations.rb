class CreatePreparations < ActiveRecord::Migration 
  def change 
    create_table :preparations do |t|
      t.string :name, { null: false, limit: 64 }
      t.string :type, { limit: 64 }

      t.timestamps
    end
  end 
end