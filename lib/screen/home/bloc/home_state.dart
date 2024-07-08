import 'package:equatable/equatable.dart';

import '../../../model/freez/freez.dart';
import '../../base/base_bloc.dart';

class HomeState extends Equatable {
  final ProgressState progressState;
  final List<Person> persons;
  final int pageNo;

  const HomeState({
    required this.progressState,
    required this.persons,
    required this.pageNo,
  });

  @override
  List<Object> get props => [progressState, persons, pageNo];

  HomeState copyWith({
    ProgressState? progressState,
    List<Person>? persons,
    int? pageNo,
  }) {
    return HomeState(
      progressState: progressState ?? this.progressState,
      persons: persons ?? this.persons,
      pageNo: pageNo ?? this.pageNo,
    );
  }
}
