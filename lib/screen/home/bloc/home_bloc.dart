import 'package:demo_application/config/router/go_router_config.dart';
import 'package:demo_application/service/error/error_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../model/freez/freez.dart';
import '../../base/base_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  List<Person> personList = [];
  int pageNo = 1;
  bool loadData = true;

  HomeBloc(BuildContext context)
      : super(
            const HomeState(
              persons: [],
              progressState: ProgressState.loading,
              pageNo: 1,
            ),
            context) {
    on<HomeEvent>(_eventManager);
  }

  Future<void> _eventManager(HomeEvent event, Emitter<HomeState> emit) async {
    switch (event) {
      case GetAllPerson():
        await _getAllPersonDetail(event, emit);
      case GetPerson():
        await _getPersonDetail(event, emit);
    }
  }

  Future<void> _getAllPersonDetail(GetAllPerson event, Emitter<HomeState> emit) async {
    if (loadData == false) return;
    showDismissProgressDialog(true);
    (await repository.getPersons(event.pageNo)).fold(
      (Failure failure) {
        showDismissProgressDialog(false);
        showSnackBar(failure);
        emit(state.copyWith(progressState: ProgressState.error));
      },
      (PersonInfo persons) {
        showDismissProgressDialog(false);
        personList.addAll(persons.data);
        loadData = persons.data.isNotEmpty;
        pageNo++;
        emit(state.copyWith(
          persons: personList,
          progressState: ProgressState.success,
          pageNo: pageNo,
        ));
      },
    );
  }

  Future<void> _getPersonDetail(GetPerson event, Emitter<HomeState> emit) async {
    progressDialog.show();
    (await repository.getPerson(event.personId)).fold(
      (Failure failure) {
        progressDialog.dismiss();
        showSnackBar(failure);
        emit(state.copyWith(progressState: ProgressState.error));
      },
      (Person person) {
        progressDialog.dismiss();
        debugPrint('person: $person');
        context.pushNamed(RouterPath.detailScreen, extra: person);
      },
    );
  }

  void showDismissProgressDialog(bool show) {
    if (pageNo > 1) {
      if (show) {
        progressDialog.show();
      } else {
        progressDialog.dismiss();
      }
    }
  }
}
