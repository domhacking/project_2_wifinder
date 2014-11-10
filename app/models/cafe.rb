class Cafe < ActiveRecord::Base
  attr_accessible :building_number, :cafe_description, :cafe_name, :contact_email, :contact_tel, :latitude, :longitude, :opening_hours, :postcode, :street_name, :website_link, :wifi_network_name, :wifi_password
end
