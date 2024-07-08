import 'package:demo_application/config/dio/dio_config.dart';
import 'package:demo_application/model/mapper/mapper.dart';
import 'package:demo_application/service/api/api.dart';
import 'package:demo_application/service/error/error_handler.dart';
import 'package:demo_application/service/network/network.dart';
import 'package:demo_application/service/repository/repository.dart';
import 'package:demo_application/service/repository/repository_imp.dart';
import 'package:demo_application/service/source/source.dart';
import 'package:demo_application/service/source/source_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../config/router/go_router_config.dart';
import '../model/mapper/mapper_imp.dart';

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
    printTime: true,
  ),
);

Future<void> initializer() async {
  instance.registerLazySingleton<GoRouterConfig>(() => GoRouterConfig());
  Mapper mapper = MapperImpl();
  ErrorHandler errorHandler = ErrorHandler();
  Network network = Network();
  DioConfig dioConfig = DioConfig();
  Api api = Api(dioConfig.initDio());
  Source source = SourceImpl(api);
  Repository repository = RepositoryImp(source, network, errorHandler, mapper);
  instance.registerLazySingleton<Repository>(() => repository);
}
