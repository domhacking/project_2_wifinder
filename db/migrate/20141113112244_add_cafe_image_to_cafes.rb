class AddCafeImageToCafes < ActiveRecord::Migration
  def change
    add_column :cafes, :cafe_image, :string
  end
end
