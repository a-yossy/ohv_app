class CreateCds < ActiveRecord::Migration[6.1]
  def change
    create_table :cds do |t|
      t.string :format
      t.string :picture
      t.string :title
      t.string :release_date
      t.string :price
      t.string :url

      t.timestamps
    end
  end
end
