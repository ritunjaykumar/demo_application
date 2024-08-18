import 'package:demo_application/application/initializer.dart';
import 'package:demo_application/native/shared_preference.dart';
import 'package:demo_application/screen/setting/setting_model.dart';
import 'package:demo_application/service/error/error_model.dart';
import 'package:demo_application/service/native/geo_location.dart';
import 'package:demo_application/service/repository/news/news_repository.dart';
import 'package:demo_application/service/repository/weather/weather_repository.dart';
import 'package:flutter/material.dart';

import '../../widget/dialog/dialog.dart';

abstract class BaseProvider extends ChangeNotifier {
  @protected
  final BuildContext context;
  @protected
  final WeatherRepository weatherRepository;
  ProgressStatus progressState;
  @protected
  final ProgressDialog progressDialog;
  @protected
  final GeoLocationService geoLocationService;
  @protected
  final NewsRepository newsRepository;
  final SettingDetail settingDetail;
  @protected
  final SharedPreferenceStorage sharedPreferenceStorage;

  Failure failure = Failure.constant();

  BaseProvider(this.context, {this.progressState = ProgressStatus.loading})
      : weatherRepository = instance<WeatherRepository>(),
        geoLocationService = instance<GeoLocationService>(),
        settingDetail = instance<SettingDetail>(),
        sharedPreferenceStorage = instance<SharedPreferenceStorage>(),
        newsRepository = instance<NewsRepository>(),
        progressDialog = ProgressDialog(context);

  void showSnackBar(Failure failure) {
    showSnackBarMessage(failure.message);
  }

  void showSnackBarMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void init() {}
}

enum ProgressStatus {
  loading,
  error,
  success;
}
