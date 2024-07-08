import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../../config/dio/dio_config.dart';
import '../../model/response/response.dart';

part 'api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET('/api/users')
  Future<PersonRespDto> getPersons(@Query('page') int page);

  @GET('/api/users/{userId}')
  Future<PersonDetail> getPerson(@Path() int userId);
}
