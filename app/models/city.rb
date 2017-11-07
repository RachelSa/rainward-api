class City < ApplicationRecord

  def rate_forecast
    if chilly?
      rating += 1
    end
    if freezing?
      rating += 1
    end
    if rainy?
      rating += 2
    end
    if cloudy?
      rating += 1
    end
    if windy?
      rating += 1
    end  
  end



end
