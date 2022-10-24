class CreateUserBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_bikes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bike, null: false, foreign_key: true
      t.string :bike_image

      t.timestamps
    end
  end
end
