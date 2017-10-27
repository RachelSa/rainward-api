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

# New York, LA, Toronto, Chicago, Montreal, Philidelphia, Calgary, Ottowa, Edmonton, San Fracisco, Mississauga,
# Winnipeg, Seattle, Denver, Detroit, Boston, Portland, Vancouver, Milwaukee, Brampton, Hamilton, Quebec City, Surrey
####


top_cities = [5128581, 5368361, 6167865, 4887398, 6077243, 4560349, 5913490, 6094817, 5946768, 5391959, 6075357, 6183235, 5809844, 4853799, 5419384, 4990729, 4930956, 5746545, 6173331, 5263045, 5907364, 5969785, 6325494, 6159905]

top_cities.each do |city_id|
  city = Cities.find(|city| city["id"] == city_id)
  City.create(api_id: city["id"], name:city["name"], country:city["country"], lat: city["coord"]["lat"], lon: city["coord"]["lon"], rating:0)
