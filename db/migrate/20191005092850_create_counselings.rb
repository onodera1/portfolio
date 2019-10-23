class CreateCounselings < ActiveRecord::Migration[5.2]
  def change
    create_table :counselings do |t|
      t.references :user
      t.string :title
      t.string :body
      t.string :image_id
      t.references :industry, foreign_key: true
      t.integer :impressions_count, default: 0
      t.timestamps
    end
  end
end
