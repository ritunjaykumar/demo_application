import 'package:dartz/dartz.dart';
import 'package:demo_application/model/freez/freez.dart';
import 'package:demo_application/service/error/error_handler.dart';
import 'package:demo_application/service/error/error_model.dart';
import 'package:demo_application/service/repository/repository.dart';
import 'package:demo_application/service/source/source.dart';

import '../../model/mapper/mapper.dart';
import '../network/network.dart';

class RepositoryImp implements Repository {
  final Source _source;
  final Network _network;
  final ErrorHandler _errorHandler;
  final Mapper _mapper;

  RepositoryImp(this._source, this._network, this._errorHandler, this._mapper);

  @override
  Future<Either<Failure, Person>> getPerson(int personId) async {
    if (await _network.checkNetworkStatus == false) {
      return Left(Failure.noInternet());
    }
    try {
      final response = await _source.getPerson(personId);
      return Right(_mapper.person(response.data));
    } catch (error) {
      return Left(_errorHandler.handleError(error));
    }
  }

  @override
  Future<Either<Failure, PersonInfo>> getPersons(int pageNo) async {
    if (await _network.checkNetworkStatus == false) {
      return Left(Failure.noInternet());
    }
    try {
      final response = await _source.getPersons(pageNo);
      return Right(_mapper.personInfo(response));
    } catch (error) {
      return Left(_errorHandler.handleError(error));
    }
  }
}
