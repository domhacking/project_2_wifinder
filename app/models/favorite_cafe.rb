class FavoriteCafe < ActiveRecord::Base
  attr_accessible :cafe_id, :user_id

  belongs_to :cafe
  belongs_to :user
end
