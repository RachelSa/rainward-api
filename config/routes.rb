Rails.application.routes.draw do
  get "/suggestions", to: "suggestions#suggestions_endpoints"
  get "/suggestions/us-northeast", to: "suggestions#us_northeast"
  get "/suggestions/us-northwest", to: "suggestions#us_northwest"
  get "/suggestions/ca-northeast", to: "suggestions#ca_northeast"
  get "/suggestions/ca-northwest", to: "suggestions#ca_northwest"
end
