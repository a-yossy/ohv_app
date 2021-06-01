class CreateInformation < ActiveRecord::Migration[6.1]
  def change
    create_table :information do |t|
      t.string :title, null: false
      t.string :picture, null: false
      t.string :information_date, null: false
      t.text :content, null: false
      t.integer :information_number, null: false

      t.timestamps
    end
  end
end
