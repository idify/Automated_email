class AddColumnToMailes < ActiveRecord::Migration
  def change
    add_column :mailes, :token, :string
  end
end
