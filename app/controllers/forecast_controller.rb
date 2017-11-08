class ForecastController < ApplicationController

  def suggestions
    cities = City.all
     key = Rails.application.secrets.weather_key

    # for each city, get its forecast
    forecasts = cities.map do |city|
      weather = RestClient.get("http://api.openweathermap.org/data/2.5/forecast?id=#{city.api_id}&appid=#{key}")
      parsed_weather = JSON.parse(weather)
      # for each city's forecasts, make a Forecast instance
      parsed_weather["list"].map do |w|
        byebug
        f = Forecast.create(current_temp:w["main"]["temp"], wind_speed:w["wind"]["speed"], cloud_coverage:w["clouds"]["all"], weather_code:w["weather"][0]['id'], city_id: city.id)
        f.rate_forecast
        byebug
      end
      # now rate each city based on its forecasts


    end
  end


end
