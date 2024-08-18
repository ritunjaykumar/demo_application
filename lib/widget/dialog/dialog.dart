import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


part 'dialog.widget.dart';

abstract class BaseDialog {
  final BuildContext context;
  bool visible;

  BaseDialog(this.context) : visible = false;

  Future<T?> show<T>() async {
    visible = true;
    return null;
  }

  void dismiss() {
    if (visible) {
      visible = false;
      context.pop();
    }
  }
}

class ProgressDialog extends BaseDialog {
  ProgressDialog(super.context, {this.title});

  String? title;

  @override
  Future<T?> show<T>() async {
    super.show();
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => _ProgressDialogWidget(
        title: title,
      ),
    );
  }

  @override
  void dismiss() {
    title = null;
    super.dismiss();
  }
}
