# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

city_file = File.read("./db/city.list.json")
all_cities = JSON.parse(city_file)

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

us_cities_east = [5128581, 4887398, 4560349, 4990729, 4930956]
us_cities_west = [5391959, 5809844, 4853799, 5746545]
ca_cities_east = [
  {api_id: 6167865, photo_url:"https://c1.staticflickr.com/5/4474/37673164706_0887fd4285.jpg", photo_cred:"VV Nincic"},
  {api_id: 6077243, photo_url:"https://c1.staticflickr.com/3/2879/10868993613_ef79ef5c35.jpg", photo_cred:"Franck_Michel"},
  {api_id: 6094817},
  {api_id: 6075357, photo_url:"https://c1.staticflickr.com/9/8277/29445364043_380699e867.jpg", photo_cred:"Mustang Joe"},
  {api_id: 6183235},
  {api_id: 6325494, photo_url:"https://c2.staticflickr.com/6/5530/30426254831_5b973f8d4c.jpg", photo_cred:"*_*"},
]
# Toronto, Montreal, Ottowa, Mississauga, Winnipeg, Quebec City

ca_cities_west = [
  {api_id: 5913490, photo_url:"https://c1.staticflickr.com/5/4447/37066091734_a055d8187b.jpg", photo_cred:"leesamlong"},
  {api_id: 5946768, photo_url:"https://c2.staticflickr.com/6/5487/9094158034_247034b612.jpg", photo_cred:"naturalflo"},
  {api_id: 6173331, photo_url:"https://c2.staticflickr.com/4/3782/13884197302_3a4b0d948e.jpg", photo_cred:"Kurayba"},
  {api_id: 6159905, photo_url:"", photo_cred:""},
]
# Vancouver, Calgary, Edmonton, Surrey

us_cities_east.each do |city_id|
  city = all_cities.find {|city| city["id"] == city_id}
  City.create(api_id: city["id"], name:city["name"], country:city["country"], lat: city["coord"]["lat"], lon: city["coord"]["lon"], rating:0, region:"usne")
end

us_cities_west.each do |city_id|
  city = all_cities.find {|city| city["id"] == city_id}
  City.create(api_id: city["id"], name:city["name"], country:city["country"], lat: city["coord"]["lat"], lon: city["coord"]["lon"], rating:0, region:"usnw")
end

def make_city_objects(regional_cities, cities, regional_code)
  regional_cities.each do |ca_city|
    city = cities.find do |city_data|
      city_data["id"] == ca_city[:api_id]
    end
    created_city = City.create(api_id: city["id"], name:city["name"], country:city["country"], lat: city["coord"]["lat"], lon: city["coord"]["lon"], rating:0, region:regional_code)
    if ca_city[:photo_url]
      created_city.photo_url = ca_city[:photo_url]
    end
    if ca_city[:photo_cred]
       created_city.photo_cred = ca_city[:photo_cred]
     end
     created_city.save
  end
end
make_city_objects(ca_cities_east, all_cities, "cane")
make_city_objects(ca_cities_west, all_cities, "canw")

ny = City.find_by(api_id: 5128581)
ny.photo_url = "https://c2.staticflickr.com/8/7551/16164053956_6ea773f001.jpg"
ny.photo_cred = "stevenpisano"
ny.save

chicago = City.find_by(api_id: 4887398)
chicago.photo_url = "https://c2.staticflickr.com/6/5566/15253643875_fe29540ddf.jpg"
chicago.save

phili = City.find_by(api_id: 4560349)
phili.photo_url = "https://c1.staticflickr.com/7/6034/5886078117_81736521e3.jpg"
phili.save

bos = City.find_by(api_id: 4930956)
bos.photo_url = "https://c1.staticflickr.com/3/2279/2215012629_71f107ce6a.jpg"
bos.save

sf = City.find_by(api_id: 5391959)
sf.photo_url = "https://c2.staticflickr.com/6/5123/5270012061_0c55683a5c.jpg"
sf.save

seattle = City.find_by(api_id: 5809844)
seattle.photo_url = "https://c2.staticflickr.com/8/7168/13739615004_e6c695cb69.jpg"
seattle.save

portland = City.find_by(api_id: 5746545)
portland.photo_url = "https://c1.staticflickr.com/9/8226/8576069040_a4bd9e1831.jpg"
portland.photo_cred = "gsloan"
portland.save
