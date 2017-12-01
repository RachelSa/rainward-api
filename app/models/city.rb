class City < ApplicationRecord
  belongs_to :suggestion, optional: true

  def get_forecast
     # key = Rails.application.secrets.weather_key
      key = ENV["WEATHER_KEY"]
    weather = RestClient.get("http://api.openweathermap.org/data/2.5/forecast?id=#{api_id}&appid=#{key}")
    JSON.parse(weather)
  end

  def self.three_dreariest
    order(rating: :desc).limit(3)
  end



end
