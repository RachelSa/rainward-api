# Using the Rainward API

[Rainward](https://floating-escarpment-37906.herokuapp.com/suggestions) is an open API that provides JSON data about cities in the US and Canada with dreary and drizzly five-day weather forecasts. 

This API uses forecast data from the [OpenWeatherMap API](https://openweathermap.org/).

## What the Rainward API Provides
The Rainward API has four endpoints, each of which returns a list of three ranked cities for a North American region. The regions are US Northeast, US Northwest, Canada East, and Canada West.

Cities are ordered by their dreariness ranking. The top-ranked city has the most dreary and drizzly weather forecast, as determined by the Rainward API. 

Regional data for each endpoint is updated once daily.


## Endpoints
- https://floating-escarpment-37906.herokuapp.com/suggestions/us-northeast
    + Top three US east coast cities, ranked by coldness, raininess, cloudiness, and windiness.
-  https://floating-escarpment-37906.herokuapp.com/suggestions/us-northwest
    + Top three US west coast cities, ranked by coldness, raininess, cloudiness, and windiness.    
- https://floating-escarpment-37906.herokuapp.com/suggestions/ca-northeast
    + Top three Canadian east coast cities, ranked by coldness, raininess, cloudiness, and windiness.   
- https://floating-escarpment-37906.herokuapp.com/suggestions/us-northwest
    + Top three US east coast cities, ranked by coldness, raininess, cloudiness, and windiness.   

### City Attributes
Example JSON data for a city:

```
{
    "id": 102,
    "api_id": 5037649,
    "rating": 50,
    "name": "Minneapolis",
    "country": "US",
    "lat": 44.979969,
    "lon": -93.26384,
    "region": "usne",
    "photo_url": "https://c2.staticflickr.com/4/3080/2689753217_7dd38083ba.jpg",
    "current_description": "broken clouds",
    "current_temp": 80.6,
    "suggestion_id": 1,
    "photo_cred": "Tony Webster",
    "precipitation_rating": 24,
    "temperature_rating": 0,
    "cloudiness_rating": 20,
    "windiness_rating": 6
  }
  ```
### Attribute Descriptions
*id:* unique ID for the city  
*api_id:* city's unique id in the [OpenWeatherMap API](https://openweathermap.org/)  
*rating:* Rainward dreariness rating for a city. Cities are listed in descending order of rating.  
*name:* city name  
*country:* country where the city is located [provided by OpenWeatherMap]  
*lat:* latitude [provided by OpenWeatherMap]  
*lon:* longitude [provided by OpenWeatherMap]  
*region:* regional code for the city's location  
*photo_url:* a rainy photo of the city or default rainy photo. Photos are from [Flickr](https://www.flickr.com/) with commercial use allowed.    
*photo_cred:* credit to the flickr user for the photo in photo_url  
*precipitation_rating:* scoring (0 to 30) of the city's forecasted precipitation  
*temperature_rating:* scoring (0 to 30) of the city's forecasted temperature  
*cloudiness_rating:* scoring (0 to 30) of the city's forecasted cloudiness  
*windiness_rating:* scoring (0 to 30) of the city's forecasted windiness  

## How the Rainward API Ranks Cities
The **ranking** for a city is determined by its forecasted precipitation, temperature, cloudiness, and windiness. 

Using data from [OpenWeatherMap API](https://openweathermap.org/), cities receive a point for a each evaluated forecast with a predicted temperature under 50 F, chance of rain, cloud coverage over 50%, and wind speeds greater than 5 meter/second. 

## Regions and Cities
Cities are manually seeded to the Rainward API by region.

### US Northeast
This region covers the northeastern US and midwest.

All Rainward cities in this region are: Philadelphia, Chicago, Columbus, Indianapolis, New York, Minneapolis, Detroit, Milwaukee, Boston, Burlington, Portland

### US Northwest
This region covers the northwestern US.

All Rainward cities in this region are: Omaha, St. Louis, St. Paul, Boise, Sacramento, Seattle, Denver, Portland, San Francisco

### Canada East
This region covers all cities on the eastern half of Canada.

All Rainward cities in this region are: Ottawa, Mississauga, Toronto, Winnipeg, Quebec, Montreal

### Canada West
This region covers all cities on the western half of Canada.

All Rainward cities in this region are: Calgary, Surrey, Vancouver, Edmonton
