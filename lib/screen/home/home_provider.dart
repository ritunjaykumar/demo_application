import 'package:demo_application/application/initializer.dart';
import 'package:demo_application/screen/home/weather_model.dart';
import 'package:demo_application/service/error/error_model.dart';
import 'package:go_router/go_router.dart';

import '../../config/router/go_router_config.dart';
import '../base/base_provider.dart';

class HomeProvider extends BaseProvider {
  HomeProvider(super.context);

  WeatherDetail? _weatherDetail;
  Forecast? _forecast;
  List<NewsHeadline> _headlines = [];

  Future<void> getCurrentWeatherInfo() async {
    progressState = ProgressStatus.loading;
    notifyListeners();
    (double, double) location;
    try {
      location = await _getCurrentLocation();
    } catch (error) {
      failure = Failure(
        status: 100,
        error: 'Geo Location',
        message: error.toString(),
      );
      progressState = ProgressStatus.error;
      notifyListeners();
      return;
    }

    (await weatherRepository.getCurrentWeather(location.$1, location.$2,
            unit: settingDetail.temperature))
        .fold(
      (Failure failure) {
        super.failure = failure;
        progressState = ProgressStatus.error;
        notifyListeners();
      },
      (WeatherDetail weatherDetail) {
        _weatherDetail = weatherDetail;
        progressState = ProgressStatus.success;
        _getNews(weatherDetail.systemInfo.country, weatherDetail.weatherInfo.temperature);
        notifyListeners();
      },
    );

    _getForecastDetail(location.$1, location.$2);
  }

  Future<void> _getForecastDetail(double lat, double lon) async {
    (await weatherRepository.getForecast(lat, lon, unit: settingDetail.temperature)).fold(
      (Failure failure) {
        showSnackBar(failure);
      },
      (Forecast forecast) {
        _forecast = forecast;
        notifyListeners();
      },
    );
  }

  Future<(double, double)> _getCurrentLocation() async {
    try {
      logger.i('getting current location');
      var location = await geoLocationService.getCurrentLocation(openSetting: true);
      return (location.latitude, location.longitude);
    } catch (error) {
      logger.i('getting current location error: $error');
      showSnackBarMessage(error.toString());
      rethrow;
    }
  }

  Future<void> _getNews(String country, double temp) async {
    (await newsRepository.getNewsHeadline(country, query(temp), settingDetail.category)).fold(
      (Failure failure) {
        showSnackBar(failure);
      },
      (List<NewsHeadline> headlines) {
        _headlines = headlines;
        notifyListeners();
      },
    );
  }

  Future<void> onSettingClick() async {
    settingDetail.reload = false;
    await context.pushNamed(RouterPath.settingScreen);
    if(settingDetail.reload) {
      getCurrentWeatherInfo();
    }
  }

  Forecast? get forecast => _forecast;

  List<ForecastDetail> get forecastDetails => _forecast == null ? [] : _forecast!.forecastDetails;

  WeatherDetail? get weatherDetail => _weatherDetail;

  List<NewsHeadline> get headlines => _headlines;

  var depressingKeywords = [
    'death',
    'terror' /*'crisis',  'war', 'tragedy'*/
  ];
  var fearKeywords = [
    'terror' /* 'attack', ,'danger', 'fear'*/
  ];
  var positiveKeywords = [
    'win',
    'happy', /*'success', 'celebrate'*/
  ];

  String query(double temperature) {
    String query;
    if (temperature < 10) {
      query = depressingKeywords.join(' OR ');
    } else if (temperature > 30) {
      query = fearKeywords.join(' OR ');
    } else {
      query = positiveKeywords.join(' OR ');
    }
    return Uri.encodeQueryComponent(query);
  }
}
