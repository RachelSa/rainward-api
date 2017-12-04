class Suggestion < ApplicationRecord
  has_many :cities

  def get_cities
    regional_cities = City.where(region: region)
    regional_cities.map do |city|
      parsed_weather = city.get_forecast
      rating = 0
      parsed_weather["list"][0..30].each do |weatha|
        forecast = Forecast.new(current_temp:weatha["main"]["temp"], wind_speed:weatha["wind"]["speed"], cloud_coverage:weatha["clouds"]["all"], weather_code:weatha["weather"][0]['id'], city_id: city.id)
        rating += forecast.rate_forecast
      end
      city.rating = rating
      city.save
    end
    top_cities = regional_cities.order(rating: :desc).limit(3)
    self.cities.concat(top_cities)
  end
end
