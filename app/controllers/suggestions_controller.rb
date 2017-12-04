class SuggestionsController < ApplicationController
  #add error check if no suggestion
  def us_northeast
    suggestion = Suggestion.find_by(region: "usne")
    update_with_current_weather(suggestion)
    render json: suggestion.cities
  end

  def us_northwest
    suggestion = Suggestion.find_by(region: "usnw")
    update_with_current_weather(suggestion)
    render json: suggestion.cities
  end

  def ca_northeast
    suggestion = Suggestion.find_by(region: "cane")
    update_with_current_weather(suggestion)
    render json: suggestion.cities
  end

  def ca_northwest
    suggestion = Suggestion.find_by(region: "canw")
    update_with_current_weather(suggestion)
    render json: suggestion.cities
  end

  private
    def update_with_current_weather(suggestion)
      suggestion.cities.each {|city| city.add_current_weather}
    end

end
