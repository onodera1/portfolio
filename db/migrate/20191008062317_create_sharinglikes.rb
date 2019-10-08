class CreateSharinglikes < ActiveRecord::Migration[5.2]
  def change
    create_table :sharinglikes do |t|
    	t.integer :user_id
    	t.integer :sharing_id

      t.timestamps
    end
  end
end
