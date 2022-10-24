class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :image
      t.integer :cruising_distance
      t.integer :displacement

      t.timestamps
    end
  end
end
