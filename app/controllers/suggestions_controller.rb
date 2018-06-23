class SuggestionsController < ApplicationController
  #add error check if no suggestion
  def us_northeast
    suggestion = Suggestion.find_by(region: "usne")
    update_with_current_weather(suggestion)
    display_cities = order_desc_rating(suggestion)
    render json: display_cities
  end

  def us_northwest
    suggestion = Suggestion.find_by(region: "usnw")
    update_with_current_weather(suggestion)
    display_cities = order_desc_rating(suggestion)
    render json: display_cities
  end

  def ca_northeast
    suggestion = Suggestion.find_by(region: "cane")
    update_with_current_weather(suggestion)
    display_cities = order_desc_rating(suggestion)
    render json: display_cities
  end

  def ca_northwest
    suggestion = Suggestion.find_by(region: "canw")
    update_with_current_weather(suggestion)
    display_cities = order_desc_rating(suggestion)
    render json: display_cities
  end

  def suggestions_endpoints
    render json: Suggestion.endpoints_list
  end

  private
    def update_with_current_weather(suggestion)
      suggestion.cities.each {|city| city.add_current_weather}
    end

    def order_desc_rating(suggestion)
      suggestion.cities.order(rating: :desc)
    end

end
