class CreateMailes < ActiveRecord::Migration
  def change
    create_table :mailes do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.string :body
      t.date :date
      t.references :user
      t.timestamps
    end
  end
end
