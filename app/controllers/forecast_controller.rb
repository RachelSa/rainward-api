class ForecastController < ApplicationController

  def suggestions
    City.update_all(rating: 0)
    forecasts = City.all.map do |city|
      parsed_weather = city.get_forecast
      parsed_weather["list"][0..30].each do |weatha|
        if save_time?(weatha["dt_txt"][11..-1])
          forecast = Forecast.new(current_temp:weatha["main"]["temp"], wind_speed:weatha["wind"]["speed"], cloud_coverage:weatha["clouds"]["all"], weather_code:weatha["weather"][0]['id'], city_id: city.id)
          forecast.rate_forecast
        end
      end
    end
    @three_dreariest = City.three_dreariest
    render json: @three_dreariest
  end

  private

  def save_time?(time)
    time == "00:00:00" || time == "12:00:00"
  end


end
