import 'package:demo_application/model/mapper/mapper.dart';
import 'package:demo_application/model/response/response.dart';
import 'package:demo_application/screen/home/weather_model.dart';

class MapperImpl implements Mapper {
  @override
  WeatherDetail weatherDetail(WeatherRespDto detail) {
    return WeatherDetail(
      coord: coord(detail.coord),
      weathers: weathers(detail.weathers),
      weatherInfo: weatherInfo(detail.weatherInfo),
      wind: windInfo(detail.wind),
      systemInfo: systemInfo(detail.systemInfo),
      datetime: detail.datetime,
      areaName: detail.areaName,
      id: detail.id,
    );
  }

  @override
  Coord coord(CoordRespData response) {
    return Coord(
      latitude: response.latitude,
      longitude: response.longitude,
    );
  }

  @override
  Weather weather(WeatherRespData response) {
    return Weather(
      id: response.id,
      main: response.main,
      description: response.description,
      icon: response.icon,
    );
  }

  @override
  WeatherInfo weatherInfo(WeatherInfoRespData response) {
    return WeatherInfo(
      temperature: response.temperature,
      temperatureMin: response.temperatureMin,
      temperatureMax: response.temperatureMax,
      pressure: response.pressure,
      humidity: response.humidity,
    );
  }

  @override
  WindInfo windInfo(WindInfoRespData response) {
    return WindInfo(
      speed: response.speed,
      deg: response.deg,
      gust: response.gust,
    );
  }

  @override
  List<Weather> weathers(List<WeatherRespData> response) {
    return response.map(weather).toList();
  }

  @override
  SystemInfo systemInfo(SystemInfoRespData response) {
    return SystemInfo(
      type: response.type,
      id: response.id,
      country: response.country,
      sunrise: response.sunrise,
      sunset: response.sunset,
    );
  }

  @override
  City city(CityRespData response) {
    return City(
      id: response.id,
      areaName: response.areaName,
      coord: coord(response.coord),
      country: response.country,
      sunrise: response.sunrise,
      sunset: response.sunset,
    );
  }

  @override
  Forecast forecast(ForecastRespDto response) {
    return Forecast(
      forecastDetails: forecastDetails(response.forecasts),
      city: city(response.city),
    );
  }

  @override
  ForecastDetail forecastDetail(ForecastRespData response) {
    return ForecastDetail(
      weathers: weathers(response.weathers),
      weatherInfo: weatherInfo(response.weatherInfo),
      wind: windInfo(response.wind),
      dateTime: response.dateTime,
    );
  }

  @override
  List<ForecastDetail> forecastDetails(List<ForecastRespData> response) {
    return response.map(forecastDetail).toList();
  }

  @override
  NewsHeadline newsHeadline(NewsHeadlineRespData response) {
    return NewsHeadline(
      author: response.author,
      title: response.title,
      url: response.url,
      image: response.image,
      content: response.content,
      description: response.description,
      publishDate: response.publishDate,
    );
  }
}
