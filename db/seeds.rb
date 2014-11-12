# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
Cafe.delete_all

cafe1 = Cafe.create!(cafe_name: "Dave's Cafe", building_number: "2", cafe_description: "Lovely Coffee and GREAT wifi", contact_email: "dc@gmail.com", contact_tel: "02079373415", opening_hours: "Mon-Sun 07:30 - 18:30", postcode: "SW3 4DA", street_name: "Redburn Street", website_link: "www.26grains.com", wifi_network_name: "davescafe", wifi_password:"123456")

cafe2 = Cafe.create!(cafe_name: "Beth's Cafe", building_number: "44", cafe_description: "Lovely Coffee and GREAT wifi", contact_email: "bc@gmail.com", contact_tel: "02079373415", opening_hours: "Mon-Sun 07:30 - 18:30", postcode: "W8 5RQ", street_name: "Victoria Road", website_link: "www.26grains.com", wifi_network_name: "bethscafe", wifi_password:"123456")

cafe3 = Cafe.create!(cafe_name: "Lulu's Cafe", building_number: "9", cafe_description: "Lovely Coffee and GREAT wifi", contact_email: "lc@gmail.com", contact_tel: "02079373415", opening_hours: "Mon-Sun 07:30 - 18:30", postcode: "EC1R 5EN", street_name: "Backhill", website_link: "www.26grains.com", wifi_network_name: "luluscafe", wifi_password:"123456")

cafe4 = Cafe.create!(cafe_name: "Kaffeine", building_number: "2", cafe_description: "Lovely Coffee and GREAT wifi", contact_email: "dc@gmail.com", contact_tel: "02079373415", opening_hours: "Mon-Sun 07:30 - 18:30", postcode: "SW3 4DA", street_name: "Great Titchfield St", website_link: "www.kaffeine.co.uk", wifi_network_name: "kaffeinecafe", wifi_password:"123456")

cafe5 = Cafe.create!(cafe_name: "Ozone", building_number: "11", cafe_description: "Lovely Coffee and GREAT wifi", contact_email: "oz@gmail.com", contact_tel: "02079373415", opening_hours: "Mon-Sun 07:30 - 18:30", postcode: "EC2A 4AQ", street_name: "Leonard St", website_link: "www.26grain.com", wifi_network_name: "ozone", wifi_password:"123456")

cafe6 = Cafe.create!(cafe_name: "Department of Coffee and Social Affairs", building_number: "14", cafe_description: "Lovely Coffee and GREAT wifi", contact_email: "dc@gmail.com", contact_tel: "02079373415", opening_hours: "Mon-Sun 07:30 - 18:30", postcode: "EC1N 7SU", street_name: "Leather Lane", website_link: "www.26grain.com", wifi_network_name: "docasa", wifi_password:"123456")

cafe7 = Cafe.create!(cafe_name: "Monmouth", building_number: "2", cafe_description: "Lovely Coffee and GREAT wifi", contact_email: "mc@gmail.com", contact_tel: "02079373415", opening_hours: "Mon-Sun 07:30 - 18:30", postcode: "SE1 9AB", street_name: "Park Street", website_link: "www.26grain.com", wifi_network_name: "monmouthcafe", wifi_password:"123456")

cafe8 = Cafe.create!(cafe_name: "Workshop Coffee", building_number: "27", cafe_description: "Lovely Coffee and GREAT wifi", contact_email: "wc@gmail.com", contact_tel: "02079373415", opening_hours: "Mon-Sun 07:30 - 18:30", postcode: "EC1M 5RN", street_name: "Clerkenwell Road", website_link: "www.26grain.com", wifi_network_name: "workshopcoffee", wifi_password:"123456")

cafe9 = Cafe.create!(cafe_name: "Flat White", building_number: "17", cafe_description: "Lovely Coffee and GREAT wifi", contact_email: "fw@gmail.com", contact_tel: "02079373415", opening_hours: "Mon-Sun 07:30 - 18:30", postcode: "W1F 0PT", street_name: "Berwick Street", website_link: "www.26grain.com", wifi_network_name: "flatwhite", wifi_password:"123456")

cafe10 = Cafe.create!(cafe_name: "Blacksheep Coffee", building_number: "159", cafe_description: "Lovely Coffee and GREAT wifi", contact_email: "bc@gmail.com", contact_tel: "02079373415", opening_hours: "Mon-Sun 07:30 - 18:30", postcode: "NW1 7JY", street_name: "Camden High St", website_link: "www.26grain.com", wifi_network_name: "blacksheep", wifi_password:"123456")


user1 = User.create!(name: "Olivia Gibbs", email: "og@gmail.com", password: "password1", profile_image: 'image.jpg')
user2 = User.create!(name: "Stephanie Griffiths", email: "sg@gmail.com", password: "password1", profile_image: 'image.jpg')
user3 = User.create!(name: "Ella Tons", email: "et@gmail.com", password: "password1", profile_image: 'image.jpg')
user4 = User.create!(name: "Cheryl Finger", email: "cf@gmail.com", password: "password1", profile_image: 'image.jpg')
user5 = User.create!(name: "George Biggins", email: "gbs@gmail.com", password: "password1", profile_image: 'image.jpg')
user6 = User.create!(name: "Zoe Gardner", email: "zg@gmail.com", password: "password1", profile_image: 'image.jpg')
user7 = User.create!(name: "Henry Jones", email: "hj@gmail.com", password: "password1", profile_image: 'image.jpg')
user8 = User.create!(name: "Claire Legg", email: "cl@gmail.com", password: "password1", profile_image: 'image.jpg')
user9 = User.create!(name: "Sam Jam", email: "sj@gmail.com", password: "password1", profile_image: 'image.jpg')
user10 = User.create!(name: "Derek Bing", email: "db@gmail.com", password: "password1", profile_image: 'image.jpg')
user11 = User.create!(name: "Louis Fish", email: "lf@gmail.com", password: "password1", profile_image: 'image.jpg')
user12 = User.create!(name: "Emma Sykes", email: "esy@gmail.com", password: "password1", profile_image: 'image.jpg')
user13 = User.create!(name: "Gareth Forbes", email: "gf@gmail.com", password: "password1", profile_image: 'image.jpg')
user14 = User.create!(name: "Courtney Box", email: "cb@gmail.com", password: "password1", profile_image: 'image.jpg')
user15 = User.create!(name: "Ross Edwards", email: "re@gmail.com", password: "password1", profile_image: 'image.jpg')
user16 = User.create!(name: "Joey Dike", email: "jd@gmail.com", password: "password1", profile_image: 'image.jpg')
user17 = User.create!(name: "Michael Fringe", email: "mf@gmail.com", password: "password1", profile_image: 'image.jpg')
user18 = User.create!(name: "Beth Collings", email: "bc@gmail.com", password: "password1", profile_image: 'image.jpg')
user19 = User.create!(name: "Nina Strong", email: "ns@gmail.com", password: "password1", profile_image: 'image.jpg')
user20 = User.create!(name: "Lulu Jenkins", email: "lj@gmail.com", password: "password1", profile_image: 'image.jpg')
user21 = User.create!(name: "Jody Weatherall", email: "jw@gmail.com", password: "password1", profile_image: 'image.jpg')
user22 = User.create!(name: "Sean O'Connor", email: "so@gmail.com", password: "password1", profile_image: 'image.jpg')
user23 = User.create!(name: "Laura Zing", email: "lz@gmail.com", password: "password1", profile_image: 'image.jpg')
user24 = User.create!(name: "Jacob Cummings", email: "jc@gmail.com", password: "password1", profile_image: 'image.jpg')
user25 = User.create!(name: "Simon Orange", email: "sor@gmail.com", password: "password1", profile_image: 'image.jpg')
user26 = User.create!(name: "Erik Jan", email: "ej@gmail.com", password: "password1", profile_image: 'image.jpg')
user27 = User.create!(name: "Dominc Hacking", email: "dominichacking@gmail.com", password: "password1", profile_image: 'image.jpg')