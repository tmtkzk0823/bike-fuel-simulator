class AddIllustrationIdToBikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :bikes, :illustration, foreign_key: true
  end
end
