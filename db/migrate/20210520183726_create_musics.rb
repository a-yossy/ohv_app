class CreateMusics < ActiveRecord::Migration[6.1]
  def change
    create_table :musics do |t|
      t.string :type
      t.string :title
      t.string :date
      t.string :price
      t.string :url

      t.timestamps
    end
  end
end
