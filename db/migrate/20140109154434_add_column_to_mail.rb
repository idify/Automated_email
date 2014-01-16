class AddColumnToMail < ActiveRecord::Migration
  def change
    add_column :mailes, :delivery_status, :string, :default => "pending"
    add_column :mailes, :seened, :boolean, :default => false
  end
end
