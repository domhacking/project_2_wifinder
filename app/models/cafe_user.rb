class CafeUser < ActiveRecord::Base
  attr_accessible :approved_wifi_user, :cafe_admin, :cafe_id, :favourite, :rating, :review, :user_id

  belongs_to :cafe
  belongs_to :user
end
