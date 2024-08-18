import 'package:freezed_annotation/freezed_annotation.dart';

part 'freez.freezed.dart';

@freezed
class Person with _$Person {
  const factory Person(
      {required int id,
      required String email,
      required String firstname,
      required String lastname,
      required String profile}) = _Person;
}

@freezed
class PersonInfo with _$PersonInfo {
  const factory PersonInfo({
    required int page,
    required int perPage,
    required int total,
    required int totalPages,
    required List<Person> data,
  }) = _PersonInfo;
}
