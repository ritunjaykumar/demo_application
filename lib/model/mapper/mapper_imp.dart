import 'package:demo_application/model/freez/freez.dart';
import 'package:demo_application/model/mapper/mapper.dart';
import 'package:demo_application/model/response/response.dart';

class MapperImpl implements Mapper {
  @override
  Person person(PersonRespData response) {
    return Person(
      id: response.id,
      email: response.email,
      firstname: response.firstname,
      lastname: response.lastname,
      profile: response.profile,
    );
  }

  @override
  PersonInfo personInfo(PersonRespDto response) {
    return PersonInfo(
      page: response.page,
      perPage: response.perPage,
      total: response.total,
      totalPages: response.totalPages,
      data: response.data.map(person).toList(),
    );
  }
}
