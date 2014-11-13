class Cafe < ActiveRecord::Base
  attr_accessible :building_number, :cafe_description, :cafe_name, :contact_email, :contact_tel, :latitude, :longitude, :opening_hours, :postcode, :street_name, :website_link, :wifi_network_name, :wifi_password, :cafe_users_attributes, :cafe_image

  mount_uploader :cafe_image, CafeImageUploader

  belongs_to :user
  has_many :favorite_cafes
  # has_many :favorited_by, through: :favorite_cafes, source: :user

  ##### GEOCODING
  # auto-fetch coordinates from address
  geocoded_by :postcode
  after_validation :geocode, :if => lambda{ |obj| obj.postcode_changed? }

  def full_address
    # complete this and amend the geocode bit if we want to search by full address rather than just postcode
  end
  #####

  def self.withinBounds(sw, ne)
    Cafe.where(latitude: sw[0]..ne[0], longitude: sw[1]..ne[1]).limit(5)
  end

  def self.findFaves(current_user)
    current_user.favorite_cafes.map do |fave|
      Cafe.find(fave.cafe_id)
    end
  end



end
