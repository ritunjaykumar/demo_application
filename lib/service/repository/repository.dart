import 'package:dartz/dartz.dart';
import '../../model/freez/freez.dart';
import '../error/error_model.dart';

abstract class Repository {
  Future<Either<Failure, PersonInfo>> getPersons(int pageNo);

  Future<Either<Failure, Person>> getPerson(int personId);
}
