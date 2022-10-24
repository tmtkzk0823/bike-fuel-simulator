class AddManufacturerIdToBikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :bikes, :manufacture, foreign_key: true
  end
end
