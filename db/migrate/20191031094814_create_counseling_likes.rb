class CreateCounselingLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :counseling_likes do |t|
      t.integer :user_id
      t.integer :counseling_id
      t.timestamps
    end
  end
end
