import 'package:demo_application/application/initializer.dart';
import 'package:demo_application/screen/home/weather_model.dart';
import 'package:demo_application/service/error/error_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/router/go_router_config.dart';
import '../base/base_provider.dart';

class HomeProvider extends BaseProvider {
  HomeProvider(super.context);

  WeatherDetail? _weatherDetail;
  Forecast? _forecast;

  Future<void> getCurrentWeatherInfo() async {
    progressState = ProgressStatus.loading;
    notifyListeners();
    (double, double) location;
    try {
      location = await _getCurrentLocation();
    } catch (error) {
      failure = Failure(
        status: '100',
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
        List<ForecastDetail> tempForecast = [];
        tempForecast.add(forecast.forecastDetails[0]);

        var forecastDetail = forecast.forecastDetails;
        for (int i = 1; i < forecastDetail.length; i++) {
          if (!(DateUtils.dateOnly(forecastDetail[i - 1].dateTime!)
              .isAtSameMomentAs(DateUtils.dateOnly(forecastDetail[i].dateTime!)))) {
            tempForecast.add(forecastDetail[i]);
          }
        }

        _forecast = Forecast(forecastDetails: tempForecast, city: forecast.city);
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

  Future<void> onSettingClick() async {
    settingDetail.reload = false;
    await context.pushNamed(RouterPath.settingScreen);
    if (settingDetail.reload) {
      getCurrentWeatherInfo();
    }
  }

  Future<void> onArticleClick() async {
    context.push(RouterPath.articleScreenPath(_weatherDetail!.weatherInfo.temperature,
        settingDetail.symbol, _weatherDetail!.systemInfo.country));
  }

  Forecast? get forecast => _forecast;

  List<ForecastDetail> get forecastDetails => _forecast == null ? [] : _forecast!.forecastDetails;

  WeatherDetail? get weatherDetail => _weatherDetail;
}
