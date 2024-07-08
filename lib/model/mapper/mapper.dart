import '../freez/freez.dart';
import '../response/response.dart';



abstract class Mapper {
  Person person(PersonRespData response);

  PersonInfo personInfo(PersonRespDto response);
}
