class Coord {
  final double latitude;
  final double longitude;

  Coord({
    required this.latitude,
    required this.longitude,
  });
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
}

class WeatherInfo {
  final double temperature;
  final double temperatureMin;
  final double temperatureMax;
  final int pressure;
  final int humidity;

  WeatherInfo({
    required this.temperature,
    required this.temperatureMin,
    required this.temperatureMax,
    required this.pressure,
    required this.humidity,
  });
}

class WindInfo {
  final double speed;
  final int deg;
  final double gust;

  WindInfo({
    required this.speed,
    required this.deg,
    required this.gust,
  });
}

class SystemInfo {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  SystemInfo({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
}

class WeatherDetail {
  final Coord coord;
  final List<Weather> weathers;
  final WeatherInfo weatherInfo;
  final WindInfo wind;
  final SystemInfo systemInfo;
  final int datetime;
  final String areaName;
  final int id;

  WeatherDetail({
    required this.coord,
    required this.weathers,
    required this.weatherInfo,
    required this.wind,
    required this.systemInfo,
    required this.datetime,
    required this.areaName,
    required this.id,
  });
}

class ForecastDetail {
  final List<Weather> weathers;
  final WeatherInfo weatherInfo;
  final WindInfo wind;
  final DateTime? dateTime;

  const ForecastDetail({
    required this.weathers,
    required this.weatherInfo,
    required this.wind,
    this.dateTime,
  });
}

class City {
  final int id;
  final String areaName;
  final Coord coord;
  final String country;
  final int sunrise;
  final int sunset;

  const City({
    required this.id,
    required this.areaName,
    required this.coord,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
}

class Forecast {
  final List<ForecastDetail> forecastDetails;
  final City city;

  const Forecast({
    required this.forecastDetails,
    required this.city,
  });
}

class NewsHeadline {
  final String author;
  final String title;
  final String? description;
  final String url;
  final String? image;
  final DateTime? publishDate;
  final String? content;

  const NewsHeadline({
    required this.author,
    required this.title,
    this.description,
    required this.url,
    this.image,
    this.publishDate,
    this.content,
  });
}
