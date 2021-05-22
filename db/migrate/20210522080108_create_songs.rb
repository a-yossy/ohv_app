class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.integer :track_number, nul: false
      t.integer :cd_id, nul: false

      t.timestamps
    end
  end
end
