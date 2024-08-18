import '../../screen/home/weather_model.dart';
import '../response/response.dart';

abstract class Mapper {
  WeatherDetail weatherDetail(WeatherRespDto response);

  Coord coord(CoordRespData response);

  Weather weather(WeatherRespData response);

  WeatherInfo weatherInfo(WeatherInfoRespData response);

  WindInfo windInfo(WindInfoRespData response);

  List<Weather> weathers(List<WeatherRespData> response);

  SystemInfo systemInfo(SystemInfoRespData response);

  City city(CityRespData response);

  ForecastDetail forecastDetail(ForecastRespData response);

  Forecast forecast(ForecastRespDto response);

  List<ForecastDetail> forecastDetails(List<ForecastRespData> response);

  NewsHeadline newsHeadline(NewsHeadlineRespData response);
}
