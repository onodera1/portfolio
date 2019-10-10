class CreateCounselingcomments < ActiveRecord::Migration[5.2]
  def change
    create_table :counselingcomments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :counseling_id
      t.timestamps
    end
  end
end
