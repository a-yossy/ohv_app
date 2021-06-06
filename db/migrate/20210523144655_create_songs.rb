# frozen_string_literal: true

class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.integer :track_number, null: false
      t.references :cd, foreign_key: true, null: false

      t.timestamps
    end
  end
end
