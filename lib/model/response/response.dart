import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class BaseResp {
  dynamic cod;
  dynamic message;

  Map<String, dynamic> toJson() => _$BaseRespToJson(this);
}

@JsonSerializable()
class NewsBaseResp {
  @JsonKey(name: 'status', defaultValue: '')
  String? status;
  @JsonKey(name: 'totalResults', defaultValue: 0)
  int? totalResults;

  Map<String, dynamic> toJson() => _$NewsBaseRespToJson(this);
}

@JsonSerializable()
class CoordRespData {
  @JsonKey(name: 'lat')
  final double latitude;
  @JsonKey(name: 'lon')
  final double longitude;

  CoordRespData(this.latitude, this.longitude);

  factory CoordRespData.fromJson(Map<String, dynamic> json) => _$CoordRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$CoordRespDataToJson(this);
}

@JsonSerializable()
class WeatherRespData {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'main', defaultValue: '')
  final String main;
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @JsonKey(name: 'icon', defaultValue: '')
  final String icon;

  WeatherRespData(this.id, this.main, this.description, this.icon);

  factory WeatherRespData.fromJson(Map<String, dynamic> json) => _$WeatherRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRespDataToJson(this);
}

@JsonSerializable()
class WeatherInfoRespData {
  @JsonKey(name: 'temp', defaultValue: 0)
  final double temperature;
  @JsonKey(name: 'temp_min', defaultValue: 0)
  final double temperatureMin;
  @JsonKey(name: 'temp_max', defaultValue: 0)
  final double temperatureMax;
  @JsonKey(name: 'pressure', defaultValue: 0)
  final int pressure;
  @JsonKey(name: 'humidity', defaultValue: 0)
  final int humidity;

  WeatherInfoRespData(
    this.temperature,
    this.temperatureMin,
    this.temperatureMax,
    this.pressure,
    this.humidity,
  );

  factory WeatherInfoRespData.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherInfoRespDataToJson(this);
}

@JsonSerializable()
class WindInfoRespData {
  @JsonKey(name: 'speed', defaultValue: 0)
  final double speed;
  @JsonKey(name: 'deg', defaultValue: 0)
  final int deg;
  @JsonKey(name: 'gust', defaultValue: 0)
  final double gust;

  WindInfoRespData(this.speed, this.deg, this.gust);

  factory WindInfoRespData.fromJson(Map<String, dynamic> json) => _$WindInfoRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$WindInfoRespDataToJson(this);
}

@JsonSerializable()
class SystemInfoRespData {
  @JsonKey(name: 'type', defaultValue: 0)
  final int type;
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'country', defaultValue: '')
  final String country;
  @JsonKey(name: 'sunrise', defaultValue: 0)
  final int sunrise;
  @JsonKey(name: 'sunset', defaultValue: 0)
  final int sunset;

  SystemInfoRespData(this.type, this.id, this.country, this.sunrise, this.sunset);

  factory SystemInfoRespData.fromJson(Map<String, dynamic> json) =>
      _$SystemInfoRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$SystemInfoRespDataToJson(this);
}

@JsonSerializable()
class WeatherRespDto extends BaseResp {
  @JsonKey(name: 'coord')
  final CoordRespData coord;
  @JsonKey(name: 'weather', defaultValue: [])
  final List<WeatherRespData> weathers;
  @JsonKey(name: 'main')
  final WeatherInfoRespData weatherInfo;
  @JsonKey(name: 'wind')
  final WindInfoRespData wind;
  @JsonKey(name: 'sys')
  final SystemInfoRespData systemInfo;
  @JsonKey(name: 'dt')
  final int datetime;
  @JsonKey(name: 'name')
  final String areaName;
  @JsonKey(name: 'id')
  final int id;

  WeatherRespDto(
    this.coord,
    this.weathers,
    this.weatherInfo,
    this.wind,
    this.systemInfo,
    this.datetime,
    this.areaName,
    this.id,
  );

  factory WeatherRespDto.fromJson(Map<String, dynamic> json) => _$WeatherRespDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WeatherRespDtoToJson(this);
}

@JsonSerializable()
class ForecastRespData {
  @JsonKey(name: 'main')
  final WeatherInfoRespData weatherInfo;
  @JsonKey(name: 'weather', defaultValue: [])
  final List<WeatherRespData> weathers;
  @JsonKey(name: 'wind')
  final WindInfoRespData wind;
  @JsonKey(name: 'dt_txt')
  final DateTime? dateTime;

  const ForecastRespData(this.weatherInfo, this.weathers, this.wind, this.dateTime);

  factory ForecastRespData.fromJson(Map<String, dynamic> json) => _$ForecastRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastRespDataToJson(this);
}

@JsonSerializable()
class CityRespData {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'name', defaultValue: '')
  final String areaName;
  @JsonKey(name: 'coord')
  final CoordRespData coord;
  @JsonKey(name: 'country', defaultValue: '')
  final String country;
  @JsonKey(name: 'sunrise', defaultValue: 0)
  final int sunrise;
  @JsonKey(name: 'sunset', defaultValue: 0)
  final int sunset;

  CityRespData(this.id, this.areaName, this.coord, this.country, this.sunrise, this.sunset);

  factory CityRespData.fromJson(Map<String, dynamic> json) => _$CityRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$CityRespDataToJson(this);
}

@JsonSerializable()
class ForecastRespDto extends BaseResp {
  @JsonKey(name: 'list', defaultValue: [])
  final List<ForecastRespData> forecasts;
  @JsonKey(name: 'city')
  final CityRespData city;

  ForecastRespDto(this.forecasts, this.city);

  factory ForecastRespDto.fromJson(Map<String, dynamic> json) => _$ForecastRespDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ForecastRespDtoToJson(this);
}

@JsonSerializable()
class NewsHeadlineRespData {
  @JsonKey(name: 'author', defaultValue: '')
  final String author;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'url', defaultValue: '')
  final String url;
  @JsonKey(name: 'urlToImage')
  final String? image;
  @JsonKey(name: 'publishedAt')
  final DateTime? publishDate;
  @JsonKey(name: 'content')
  final String? content;

  NewsHeadlineRespData(this.author, this.title, this.description, this.url, this.image,
      this.publishDate, this.content);

  factory NewsHeadlineRespData.fromJson(Map<String, dynamic> json) =>
      _$NewsHeadlineRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewsHeadlineRespDataToJson(this);
}

@JsonSerializable()
class NewsHeadlineRespDto extends NewsBaseResp {
  @JsonKey(name: 'articles', defaultValue: [])
  final List<NewsHeadlineRespData> articles;

  NewsHeadlineRespDto(this.articles);

  factory NewsHeadlineRespDto.fromJson(Map<String, dynamic> json) =>
      _$NewsHeadlineRespDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NewsHeadlineRespDtoToJson(this);
}
