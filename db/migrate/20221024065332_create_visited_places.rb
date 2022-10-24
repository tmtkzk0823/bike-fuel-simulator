class CreateVisitedPlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :visited_places do |t|
      t.references :user, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
