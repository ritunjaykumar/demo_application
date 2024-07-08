import 'package:demo_application/model/response/response.dart';
import 'package:demo_application/service/api/api.dart';
import 'package:demo_application/service/source/source.dart';

///Here we will maintain the caching....
class SourceImpl implements Source {
  final Api _api;

  SourceImpl(this._api);

  @override
  Future<PersonDetail> getPerson(int personId) {
    return _api.getPerson(personId);
  }

  @override
  Future<PersonRespDto> getPersons(int page) {
    return _api.getPersons(page);
  }
}
