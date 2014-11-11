class Cafe < ActiveRecord::Base
  attr_accessible :building_number, :cafe_description, :cafe_name, :contact_email, :contact_tel, :latitude, :longitude, :opening_hours, :postcode, :street_name, :website_link, :wifi_network_name, :wifi_password, :cafe_users_attributes

  has_many :cafe_users
  has_many :users, through: :cafe_users
  accepts_nested_attributes_for :cafe_users

  ##### GEOCODING
  # auto-fetch coordinates from address
  geocoded_by :postcode
  after_validation :geocode, :if => lambda{ |obj| obj.postcode_changed? }

  def full_address
    # complete this and amend the geocode bit if we want to search by full address rather than just postcode
  end
  #####


end
