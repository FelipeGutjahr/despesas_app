import 'package:despesas_app/app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ErrorMessage extends StatelessWidget {
  final LoginController controller;
  const ErrorMessage({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return controller.getErrorMessage == ''
          ? Container()
          : Text(
              controller.getErrorMessage,
              style: TextStyle(
                  color: Colors.redAccent[700],
                  shadows: [Shadow(blurRadius: 10, color: Colors.black54)]),
            );
    });
  }
}
