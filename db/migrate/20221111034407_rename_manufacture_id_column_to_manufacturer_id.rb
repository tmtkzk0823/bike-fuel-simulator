class RenameManufactureIdColumnToManufacturerId < ActiveRecord::Migration[7.0]
  def change
    rename_column :bikes, :manufacture_id, :manufacturer_id
  end
end
