class City < ApplicationRecord
  def get_forecast
    key = Rails.application.secrets.weather_key
    weather = RestClient.get("http://api.openweathermap.org/data/2.5/forecast?id=#{api_id}&appid=#{key}")
    JSON.parse(weather)
  end

  def self.six_dreariest
    order(rating: :desc).limit(6)
  end



end
