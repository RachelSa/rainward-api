class ForecastController < ApplicationController

  def suggestions
    cities = City.all

    # for each city, get its forecast
    forecasts = cities.map do |city|
      weather = RestClient.get("http://api.openweathermap.org/data/2.5/forecast?id=#{city.api_id}&appid=#{key}")
      parsed_weather = JSON.parse(weather)
      parsed_weather["list"].map do |w|
        Forecast.create(current_temp:w["main"]["temp"], wind_speed:w["wind"]["speed"], cloud_coverage:w["clouds"]["all"], weather_code:w["weather"][0]['id'], city_id: city.id)
      end
      # now rate each city based on its forecasts
      cities.rate_forecast.save
    end

    byebug
    city.rate_forecast(parsed_weather)
  end

    render json: suggestions
  end


end
