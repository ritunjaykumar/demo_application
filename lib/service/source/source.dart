
import '../../model/response/response.dart';

abstract class Source{
  Future<PersonRespDto> getPersons(int page);
  Future<PersonDetail> getPerson(int personId);
}