class CreateSharings < ActiveRecord::Migration[5.2]
  def change
    create_table :sharings do |t|
      t.references :user
      t.string :title
      t.string :body
      t.string :image_id
      t.references :industry, foreign_key: true
      t.timestamps
    end
  end
end
