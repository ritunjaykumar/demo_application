import 'package:bloc/bloc.dart';
import 'package:demo_application/application/initializer.dart';
import 'package:demo_application/service/error/error_model.dart';
import 'package:flutter/material.dart';

import '../../service/repository/repository.dart';
import '../../widget/dialog/dialog.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  @protected
  final BuildContext context;
  @protected
  final Repository repository;
  ProgressState progressState;
  final ProgressDialog progressDialog;

  BaseBloc(super.s, this.context, {this.progressState = ProgressState.loading})
      : repository = instance<Repository>(),
        progressDialog = ProgressDialog(context);

  void showSnackBar(Failure failure) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message)));
  }
}

enum ProgressState {
  loading,
  error,
  success;
}
