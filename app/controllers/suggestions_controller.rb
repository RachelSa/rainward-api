class SuggestionsController < ApplicationController

  def us_northeast
    suggestion = Suggestion.find_by(region: "usne")
    render json: suggestion.cities
  end

end
