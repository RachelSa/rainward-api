class City < ApplicationRecord
  def get_forecast
    # key = Rails.application.secrets.weather_key
    weather = RestClient.get("http://api.openweathermap.org/data/2.5/forecast?id=#{api_id}&appid=#{ENV["WEATHER_KEY"]}")
    JSON.parse(weather)
  end

  def self.three_dreariest
    order(rating: :desc).limit(3)
  end



end
