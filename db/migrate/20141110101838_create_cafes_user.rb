class CreateCafesUser < ActiveRecord::Migration
  def change
    create_table :cafes_user do |t|
      t.integer :cafe_id
      t.integer :user_id
      t.integer :rating
      t.text :review
      t.boolean :favourite
      t.boolean :cafe_admin
      t.boolean :approved_wifi_user

      t.timestamps
    end
  end
end
