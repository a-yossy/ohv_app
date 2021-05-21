class AddPictureToCds < ActiveRecord::Migration[6.1]
  def change
    add_column :cds, :picture, :string
  end
end
