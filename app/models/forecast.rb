class Forecast < ApplicationRecord
  belongs_to :city


  def chilly?
   current_temp <= 285
  end

  def freezing?
     current_temp <= 273.15
  end

  def rainy?
    weather_code < 800 || weather_code == 803 || weather_code == 804 || weather_code == 955 || weather_code == 965
  end

  def cloudy?
    cloud_coverage >= 50
  end

  def windy?
    wind_speed >= 6
  end

  def rate_forecast
    if chilly?
      city.rating += 1
    end
    if freezing?
      city.rating += 1
    end
    if rainy?
      city.rating += 2
    end
    if cloudy?
      city.rating += 2
    end
    if windy?
      city.rating += 1
    end
    city.save
  end


end
