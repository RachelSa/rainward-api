class Suggestion < ApplicationRecord
  has_many :cities

  def get_cities
    regional_cities = City.where(region: region)
    regional_cities.map do |city|
      parsed_weather = city.get_forecast
      precipitation_rating, temperature_rating, cloudiness_rating, windiness_rating = 0,0,0,0
      parsed_weather["list"][0..29].each do |weatha|
        forecast = Forecast.new(current_temp:weatha["main"]["temp"], wind_speed:weatha["wind"]["speed"], cloud_coverage:weatha["clouds"]["all"], weather_code:weatha["weather"][0]['id'], city_id: city.id)
        temperature_rating += 1 if forecast.chilly?
        precipitation_rating += 1 if forecast.rainy?
        cloudiness_rating += 1 if forecast.cloudy?
        windiness_rating += 1 if forecast.windy?
      end
      city.rating = precipitation_rating + temperature_rating + cloudiness_rating + windiness_rating
      city.precipitation_rating = precipitation_rating
      city.temperature_rating = temperature_rating
      city.cloudiness_rating = cloudiness_rating
      city.windiness_rating = windiness_rating
      city.save
    end
    top_cities = regional_cities.order(rating: :desc).limit(3)
    self.cities.concat(top_cities)
  end

  def self.endpoints_list
    return {
      description: "All endpoints for the Rainward API.",
      suggestions_endpoints: [
        {us_northeast: "https://floating-escarpment-37906.herokuapp.com/suggestions/us-northeast"},
        {us_northwest: "https://floating-escarpment-37906.herokuapp.com/suggestions/us-northwest"},
        {canada_east: "https://floating-escarpment-37906.herokuapp.com/suggestions/ca-northeast"},
        {canada_west: "https://floating-escarpment-37906.herokuapp.com/suggestions/ca-northwest"}
        ]
      }
  end
end
