class ForecastController < ApplicationController

  def suggestions
    cities = City.all
    # for each city, get its forecast
    forecasts = cities.map do |city|
      parsed_weather = city.get_forecast
      # for each city's forecasts, make a Forecast instance and rate the forecast for a city
      parsed_weather["list"].each do |weatha|
        forecast = Forecast.create(current_temp:weatha["main"]["temp"], wind_speed:weatha["wind"]["speed"], cloud_coverage:weatha["clouds"]["all"], weather_code:weatha["weather"][0]['id'], city_id: city.id)
        forecast.rate_forecast
      end
    end
    @six_dreariest = City.six_dreariest
    render json: @six_dreariest
  end


end
