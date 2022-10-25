class ChangeManufacturesToManufacturers < ActiveRecord::Migration[7.0]
  def change
    rename_table :manufactures, :manufacturers
  end
end
