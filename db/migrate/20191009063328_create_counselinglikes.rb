class CreateCounselinglikes < ActiveRecord::Migration[5.2]
  def change
    create_table :counselinglikes do |t|
      t.integer :user_id
      t.integer :counseling_id
      t.timestamps
    end
  end
end
