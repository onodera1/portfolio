class CreateCounselingComments < ActiveRecord::Migration[5.2]
  def change
    create_table :counseling_comments do |t|
 	  t.text :comment
      t.integer :user_id
      t.integer :counseling_id
      t.timestamps
    end
  end
end
