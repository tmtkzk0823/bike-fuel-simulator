class CreateIllustrations < ActiveRecord::Migration[7.0]
  def change
    create_table :illustrations do |t|
      t.string :body_image
      t.string :wheel_image

      t.timestamps
    end
  end
end
