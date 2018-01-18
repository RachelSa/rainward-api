class Forecast < ApplicationRecord
  belongs_to :city


  def chilly?
   current_temp <= 283.15
  end

  # def freezing?
  #    current_temp <= 273.15
  # end

  def rainy?
    weather_code <= 701
  end

  def cloudy?
    cloud_coverage >= 50
  end

  def windy?
    wind_speed >= 6
  end

  # def rate_forecast
  #   rating = 0
  #   if chilly?
  #     rating += 1
  #   end
  #   # if freezing?
  #   #   rating += 1
  #   # end
  #   if rainy?
  #     rating += 1
  #   end
  #   if cloudy?
  #     rating += 1
  #   end
  #   if windy?
  #     rating += 1
  #   end
  #   rating
  # end


end
