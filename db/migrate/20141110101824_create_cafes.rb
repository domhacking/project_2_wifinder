class CreateCafes < ActiveRecord::Migration
  def change
    create_table :cafes do |t|
      t.integer :user_id
      t.string :cafe_name
      t.float :latitude
      t.float :longitude
      t.string :building_number
      t.string :street_name
      t.string :postcode
      t.text :cafe_description
      t.text :opening_hours
      t.string :contact_email
      t.string :contact_tel
      t.string :website_link
      t.string :wifi_network_name
      t.string :wifi_password

      t.timestamps
    end
  end
end
