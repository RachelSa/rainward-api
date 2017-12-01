Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "/suggestions", to: "forecast#suggestions"
  get "/suggestions/us-northeast", to: "suggestions#us_northeast"
end
