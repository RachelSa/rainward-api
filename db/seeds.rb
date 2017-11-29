# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

city_file = File.read("./db/city.list.json")
cities = JSON.parse(city_file)

# cities.each do |city|
#   if ["RU", "UK", "US", "GB", "UA", "CH", "SE", "SJ", "SU", "GS", "ZA", "SK", "RS", "RO", "PL", "NO", "NZ", "NL", "	LU", "LI", "LV", "KG", "KZ", "JP", "IM", "IE", "IS", "HU", "GL", "DE","GE", "FI", "EE", "DK", "CZ", "CL", "BG", "BE", "BY", "AT", "AQ", "CA"].include?(city["country"])
#     City.create(api_id: city["id"], name:city["name"], country:city["country"], lat: city["coord"]["lat"], lon: city["coord"]["lon"], rating:0)
#   end
# end

# cities.each do |city|
#   if ["US", "CA"].include?(city["country"]) && city["coord"]["lat"] > 37
#     City.create(api_id: city["id"], name:city["name"], country:city["country"], lat: city["coord"]["lat"], lon: city["coord"]["lon"], rating:0)
#   end
# end

# New York, Toronto, Chicago, Montreal, Philidelphia, Calgary, Ottowa, Edmonton, San Fracisco, Mississauga,
# Winnipeg, Seattle, Denver, Detroit, Boston, Portland, Vancouver, Milwaukee, Brampton, Hamilton, Quebec City, Surrey
####


us_cities_east = [5128581, 4887398, 4560349, 4990729, 4930956]
# us_cities_west = [5391959, 5809844, 4853799, 5746545, 5419384]
# ca_cities = [6167865, 6077243, 5913490, 6094817, 5946768, 6075357, 6183235, 6173331, 5263045, 5907364, 5969785, 6325494, 6159905]

us_cities_east.each do |city_id|
  city = cities.find {|city| city["id"] == city_id}
  City.create(api_id: city["id"], name:city["name"], country:city["country"], lat: city["coord"]["lat"], lon: city["coord"]["lon"], rating:0)
end

ny = City.find_by(api_id: 5128581)
ny.photo_url = "https://c2.staticflickr.com/8/7374/8786107863_53fc698cd5_q.jpg"
ny.save

chicago = City.find_by(api_id: 4887398)
chicago.photo_url = "https://c2.staticflickr.com/6/5564/15066948520_0013fa2c91_q.jpg"
chicago.save

phili = City.find_by(api_id: 4560349)
phili.photo_url = "https://c1.staticflickr.com/7/6034/5886078117_81736521e3_q.jpg"
phili.save

bos = City.find_by(api_id: 4930956)
bos.photo_url = "https://c1.staticflickr.com/5/4090/5173948387_cc081b5104_q.jpg"
bos.save
