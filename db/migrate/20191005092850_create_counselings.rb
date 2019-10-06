class CreateCounselings < ActiveRecord::Migration[5.2]
  def change
    create_table :counselings do |t|
      t.string :title
      t.string :body
      t.references :industry, foreign_key: true
      t.timestamps
    end
  end
end
