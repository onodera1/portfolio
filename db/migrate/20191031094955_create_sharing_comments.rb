class CreateSharingComments < ActiveRecord::Migration[5.2]
  def change
    create_table :sharing_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :sharing_id
      t.timestamps
    end
  end
end
