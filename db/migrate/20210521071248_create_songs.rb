class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :track_number
      t.references :cd

      t.timestamps
    end
  end
end
