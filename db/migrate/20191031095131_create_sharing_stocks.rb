class CreateSharingStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :sharing_stocks do |t|
      t.integer :user_id
      t.integer :sharing_id
      t.timestamps
    end
  end
end
