class Forecast < ApplicationRecord
  belongs_to :city

  def chilly?
   current_temp <= 283.15
  end

  def rainy?
    weather_code <= 701
  end

  def cloudy?
    cloud_coverage >= 50
  end

  def windy?
    wind_speed >= 6
  end


end
