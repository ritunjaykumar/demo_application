import 'package:demo_application/config/dio/news_dio_config.dart';
import 'package:demo_application/config/dio/weather_dio_config.dart';
import 'package:demo_application/model/mapper/mapper.dart';
import 'package:demo_application/native/shared_preference.dart';
import 'package:demo_application/service/api/news/news_api.dart';
import 'package:demo_application/service/api/weather/weather_api.dart';
import 'package:demo_application/service/cache/cache.dart';
import 'package:demo_application/service/error/error_handler.dart';
import 'package:demo_application/service/network/network.dart';
import 'package:demo_application/service/repository/news/news_repository.dart';
import 'package:demo_application/service/repository/news/news_repository_impl.dart';
import 'package:demo_application/service/repository/weather/weather_repository.dart';
import 'package:demo_application/service/repository/weather/weather_repository_impl.dart';
import 'package:demo_application/service/source/news/news_source.dart';
import 'package:demo_application/service/source/news/news_source_impl.dart';
import 'package:demo_application/service/source/weather/waether_source_impl.dart';
import 'package:demo_application/service/source/weather/weather_source.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/router/go_router_config.dart';
import '../model/mapper/mapper_imp.dart';
import '../screen/setting/setting_model.dart';
import '../service/native/geo_location.dart';

final GetIt instance = GetIt.instance;
final Logger logger = Logger(
  output: ConsoleOutput(),
  filter: DevelopmentFilter(),
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: false,
    dateTimeFormat: DateTimeFormat.dateAndTime,
  ),
);

Future<void> initializer() async {
  instance.registerLazySingleton<GeoLocationService>(() => GeoLocationService());
  instance.registerLazySingleton<GoRouterConfig>(() => GoRouterConfig());
  Mapper mapper = MapperImpl();
  ErrorHandler errorHandler = ErrorHandler();
  Network network = Network();
  MemoryCache memoryCache = MemoryCache();
  WeatherDioConfig dioConfig = WeatherDioConfig();
  WeatherApi weatherApi = WeatherApi(dioConfig.initDio());
  WeatherSource weatherSource = WeatherSourceImpl(weatherApi, memoryCache);
  WeatherRepository weatherRepository =
      WeatherRepositoryImpl(network, errorHandler, mapper, weatherSource);
  instance.registerLazySingleton<WeatherRepository>(() => weatherRepository);

  ///
  ///
  NewsDioConfig newsDioConfig = NewsDioConfig();
  NewsApi newsApi = NewsApi(newsDioConfig.initDio());
  NewsSource newsSource = NewsSourceImpl(newsApi: newsApi);
  NewsRepository newsRepository = NewsRepositoryImpl(
    network: network,
    errorHandler: errorHandler,
    mapper: mapper,
    newsSource: newsSource,
  );
  instance.registerLazySingleton<NewsRepository>(() => newsRepository);
  SharedPreferences sharedPreference = await SharedPreferences.getInstance();
  SharedPreferenceStorage sharedPreferenceStorage = SharedPreferenceStorage(sharedPreference);
  instance.registerLazySingleton<SharedPreferenceStorage>(() => sharedPreferenceStorage);
  var settingDetail = SettingDetail();
  settingDetail.category = sharedPreferenceStorage.category;
  settingDetail.temperature = sharedPreferenceStorage.temperature;

  instance.registerLazySingleton<SettingDetail>(() => settingDetail);
}
