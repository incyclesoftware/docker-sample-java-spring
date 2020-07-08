# Multi Stage Docker build example
`Dockerfile` contains various stages which are tagged by a name using `as`.

## Commands used
- docker build . -t weather-forecast-api:v1
- docker build . -t weather-forecast-api:v1 --target=final - Build image using a specific stage
- docker run -p 8080:8080 weather-forecast-api:v1 - Run image

## Api
- http://localhost:8080/weatherforecast