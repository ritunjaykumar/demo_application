// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResp _$BaseRespFromJson(Map<String, dynamic> json) => BaseResp()
  ..cod = json['cod']
  ..message = json['message'];

Map<String, dynamic> _$BaseRespToJson(BaseResp instance) => <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
    };

NewsBaseResp _$NewsBaseRespFromJson(Map<String, dynamic> json) => NewsBaseResp()
  ..status = json['status'] as String? ?? ''
  ..totalResults = (json['totalResults'] as num?)?.toInt() ?? 0;

Map<String, dynamic> _$NewsBaseRespToJson(NewsBaseResp instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
    };

CoordRespData _$CoordRespDataFromJson(Map<String, dynamic> json) =>
    CoordRespData(
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordRespDataToJson(CoordRespData instance) =>
    <String, dynamic>{
      'lat': instance.latitude,
      'lon': instance.longitude,
    };

WeatherRespData _$WeatherRespDataFromJson(Map<String, dynamic> json) =>
    WeatherRespData(
      (json['id'] as num?)?.toInt() ?? 0,
      json['main'] as String? ?? '',
      json['description'] as String? ?? '',
      json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$WeatherRespDataToJson(WeatherRespData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

WeatherInfoRespData _$WeatherInfoRespDataFromJson(Map<String, dynamic> json) =>
    WeatherInfoRespData(
      (json['temp'] as num?)?.toDouble() ?? 0,
      (json['temp_min'] as num?)?.toDouble() ?? 0,
      (json['temp_max'] as num?)?.toDouble() ?? 0,
      (json['pressure'] as num?)?.toInt() ?? 0,
      (json['humidity'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$WeatherInfoRespDataToJson(
        WeatherInfoRespData instance) =>
    <String, dynamic>{
      'temp': instance.temperature,
      'temp_min': instance.temperatureMin,
      'temp_max': instance.temperatureMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

WindInfoRespData _$WindInfoRespDataFromJson(Map<String, dynamic> json) =>
    WindInfoRespData(
      (json['speed'] as num?)?.toDouble() ?? 0,
      (json['deg'] as num?)?.toInt() ?? 0,
      (json['gust'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$WindInfoRespDataToJson(WindInfoRespData instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };

SystemInfoRespData _$SystemInfoRespDataFromJson(Map<String, dynamic> json) =>
    SystemInfoRespData(
      (json['type'] as num?)?.toInt() ?? 0,
      (json['id'] as num?)?.toInt() ?? 0,
      json['country'] as String? ?? '',
      (json['sunrise'] as num?)?.toInt() ?? 0,
      (json['sunset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SystemInfoRespDataToJson(SystemInfoRespData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

WeatherRespDto _$WeatherRespDtoFromJson(Map<String, dynamic> json) =>
    WeatherRespDto(
      CoordRespData.fromJson(json['coord'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>?)
              ?.map((e) => WeatherRespData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      WeatherInfoRespData.fromJson(json['main'] as Map<String, dynamic>),
      WindInfoRespData.fromJson(json['wind'] as Map<String, dynamic>),
      SystemInfoRespData.fromJson(json['sys'] as Map<String, dynamic>),
      (json['dt'] as num).toInt(),
      json['name'] as String,
      (json['id'] as num).toInt(),
    )
      ..cod = json['cod']
      ..message = json['message'];

Map<String, dynamic> _$WeatherRespDtoToJson(WeatherRespDto instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'coord': instance.coord,
      'weather': instance.weathers,
      'main': instance.weatherInfo,
      'wind': instance.wind,
      'sys': instance.systemInfo,
      'dt': instance.datetime,
      'name': instance.areaName,
      'id': instance.id,
    };

ForecastRespData _$ForecastRespDataFromJson(Map<String, dynamic> json) =>
    ForecastRespData(
      WeatherInfoRespData.fromJson(json['main'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>?)
              ?.map((e) => WeatherRespData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      WindInfoRespData.fromJson(json['wind'] as Map<String, dynamic>),
      json['dt_txt'] == null ? null : DateTime.parse(json['dt_txt'] as String),
    );

Map<String, dynamic> _$ForecastRespDataToJson(ForecastRespData instance) =>
    <String, dynamic>{
      'main': instance.weatherInfo,
      'weather': instance.weathers,
      'wind': instance.wind,
      'dt_txt': instance.dateTime?.toIso8601String(),
    };

CityRespData _$CityRespDataFromJson(Map<String, dynamic> json) => CityRespData(
      (json['id'] as num?)?.toInt() ?? 0,
      json['name'] as String? ?? '',
      CoordRespData.fromJson(json['coord'] as Map<String, dynamic>),
      json['country'] as String? ?? '',
      (json['sunrise'] as num?)?.toInt() ?? 0,
      (json['sunset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CityRespDataToJson(CityRespData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.areaName,
      'coord': instance.coord,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

ForecastRespDto _$ForecastRespDtoFromJson(Map<String, dynamic> json) =>
    ForecastRespDto(
      (json['list'] as List<dynamic>?)
              ?.map((e) => ForecastRespData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      CityRespData.fromJson(json['city'] as Map<String, dynamic>),
    )
      ..cod = json['cod']
      ..message = json['message'];

Map<String, dynamic> _$ForecastRespDtoToJson(ForecastRespDto instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'list': instance.forecasts,
      'city': instance.city,
    };

NewsHeadlineRespData _$NewsHeadlineRespDataFromJson(
        Map<String, dynamic> json) =>
    NewsHeadlineRespData(
      json['author'] as String? ?? '',
      json['title'] as String? ?? '',
      json['description'] as String?,
      json['url'] as String? ?? '',
      json['image'] as String?,
      json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      json['content'] as String?,
    );

Map<String, dynamic> _$NewsHeadlineRespDataToJson(
        NewsHeadlineRespData instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'image': instance.image,
      'publishedAt': instance.publishDate?.toIso8601String(),
      'content': instance.content,
    };

NewsHeadlineRespDto _$NewsHeadlineRespDtoFromJson(Map<String, dynamic> json) =>
    NewsHeadlineRespDto(
      (json['articles'] as List<dynamic>?)
              ?.map((e) =>
                  NewsHeadlineRespData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..status = json['status'] as String? ?? ''
      ..totalResults = (json['totalResults'] as num?)?.toInt() ?? 0;

Map<String, dynamic> _$NewsHeadlineRespDtoToJson(
        NewsHeadlineRespDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
