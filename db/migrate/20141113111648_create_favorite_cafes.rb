class CreateFavoriteCafes < ActiveRecord::Migration
  def change
    create_table :favorite_cafes do |t|
      t.integer :cafe_id
      t.integer :user_id

      t.timestamps
    end
  end
end
