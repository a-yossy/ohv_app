class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :track_number
      t.references :cd, null: false, foreign_key: true

      t.timestamps
    end
  end
end
