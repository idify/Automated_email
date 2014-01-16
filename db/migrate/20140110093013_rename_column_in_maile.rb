class RenameColumnInMaile < ActiveRecord::Migration
  def change
   rename_column :mailes, :status, :seened
  end
end
