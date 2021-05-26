class CreateLives < ActiveRecord::Migration[6.1]
  def change
    create_table :lives do |t|
      t.string :live_date, null: false
      t.string :place, null: false
      t.string :title, null: false
      t.string :detail, null: false
      t.string :open_hour, null: false
      t.string :start_hour, null: false
      t.integer :adv_price, null: false
      t.integer :door_price, null: false
      t.datetime :start_time, null: false

      t.timestamps
    end
  end
end
