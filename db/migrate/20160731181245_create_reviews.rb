class CreateReviews < ActiveRecord::Migration 
  def change 
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :coffee_id
      t.integer :preparer_id
      t.integer :preparation_id
      t.datetime :date
      t.integer :rating, { null: false }
      t.string :comments

      t.timestamps
    end
  end 
end