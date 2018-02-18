class City < ApplicationRecord
  belongs_to :suggestion, optional: true

  def get_forecast
      key = Rails.application.secrets.weather_key
    #key = ENV["WEATHER_KEY"]
    weather = RestClient.get("http://api.openweathermap.org/data/2.5/forecast?id=#{api_id}&appid=#{key}")
    JSON.parse(weather)
  end

  def add_current_weather
      key = Rails.application.secrets.weather_key
    # key = ENV["WEATHER_KEY"]
    weather = RestClient.get("http://api.openweathermap.org/data/2.5/weather?id=#{api_id}&appid=#{key}")
    parsed_weather = JSON.parse(weather)
    temp_in_k = parsed_weather["main"]["temp"]
    temp = temp_in_k * 9/5 - 459.67
    description = parsed_weather["weather"][0]["description"]
    self.update({current_temp: temp, current_description: description})
  end

  def self.three_dreariest
    order(rating: :desc).limit(3)
  end



end
