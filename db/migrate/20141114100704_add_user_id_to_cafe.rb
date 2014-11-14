class AddUserIdToCafe < ActiveRecord::Migration
  def change
    add_column :cafes, :user_id, :string
  end
end
