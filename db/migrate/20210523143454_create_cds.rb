class CreateCds < ActiveRecord::Migration[6.1]
  def change
    create_table :cds do |t|
      t.string :format, null: false
      t.string :picture, null: false
      t.string :title, null: false
      t.date :release_date, null: false
      t.integer :price, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
