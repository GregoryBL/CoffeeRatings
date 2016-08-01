class CreatePreparers < ActiveRecord::Migration 
  def change 
    create_table :preparers do |t|
      t.string :name, { null: false, limit: 64 }
      t.string :city, { limit: 64 }
      t.string :person, { limit: 64 }

      t.timestamps
    end
  end 
end