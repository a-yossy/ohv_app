class RenameDateColumnToCds < ActiveRecord::Migration[6.1]
  def change
    rename_column :cds, :date, :release_date
  end
end
