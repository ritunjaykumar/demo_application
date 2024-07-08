import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetAllPerson extends HomeEvent {
  final int pageNo;

  const GetAllPerson(this.pageNo);

  @override
  List<Object> get props => [pageNo];
}

class GetPerson extends HomeEvent {
  final int personId;

  const GetPerson(this.personId);

  @override
  List<Object> get props => [personId];
}
