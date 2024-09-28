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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherDetail &&
          runtimeType == other.runtimeType &&
          coord == other.coord &&
          weathers == other.weathers &&
          weatherInfo == other.weatherInfo &&
          wind == other.wind &&
          systemInfo == other.systemInfo &&
          datetime == other.datetime &&
          areaName == other.areaName &&
          id == other.id;

  @override
  int get hashCode =>
      coord.hashCode ^
      weathers.hashCode ^
      weatherInfo.hashCode ^
      wind.hashCode ^
      systemInfo.hashCode ^
      datetime.hashCode ^
      areaName.hashCode ^
      id.hashCode;
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastDetail &&
          runtimeType == other.runtimeType &&
          weathers == other.weathers &&
          weatherInfo == other.weatherInfo &&
          wind == other.wind &&
          dateTime == other.dateTime;

  @override
  int get hashCode => weathers.hashCode ^ weatherInfo.hashCode ^ wind.hashCode ^ dateTime.hashCode;
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is City &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          areaName == other.areaName &&
          coord == other.coord &&
          country == other.country &&
          sunrise == other.sunrise &&
          sunset == other.sunset;

  @override
  int get hashCode =>
      id.hashCode ^
      areaName.hashCode ^
      coord.hashCode ^
      country.hashCode ^
      sunrise.hashCode ^
      sunset.hashCode;
}

class Forecast {
  final List<ForecastDetail> forecastDetails;
  final City city;

  const Forecast({
    required this.forecastDetails,
    required this.city,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Forecast &&
          runtimeType == other.runtimeType &&
          forecastDetails == other.forecastDetails &&
          city == other.city;

  @override
  int get hashCode => forecastDetails.hashCode ^ city.hashCode;
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsHeadline &&
          runtimeType == other.runtimeType &&
          author == other.author &&
          title == other.title &&
          description == other.description &&
          url == other.url &&
          image == other.image &&
          publishDate == other.publishDate &&
          content == other.content;

  @override
  int get hashCode =>
      author.hashCode ^
      title.hashCode ^
      description.hashCode ^
      url.hashCode ^
      image.hashCode ^
      publishDate.hashCode ^
      content.hashCode;
}
