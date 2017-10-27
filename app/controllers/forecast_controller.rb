class ForecastController < ApplicationController

  def suggestions
    weatherDublin = RestClient.get("https://api.darksky.net/forecast/c9b017e5dfead0a2f9b5465e3854e063/53.3498,6.260")
    parsed = JSON.parse(weatherDublin)
    today = parsed["daily"]["data"][0]
    tomorrow =  parsed["daily"]["data"][1]
    byebug
  end
end
