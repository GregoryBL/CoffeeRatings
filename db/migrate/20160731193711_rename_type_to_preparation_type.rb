class RenameTypeToPreparationType < ActiveRecord::Migration 
  def change 
    rename_column :preparations, :type, :preparation_type
  end 
end