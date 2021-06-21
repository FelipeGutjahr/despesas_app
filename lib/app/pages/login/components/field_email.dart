import 'package:despesas_app/app/pages/login/login_controller.dart';
import 'package:despesas_app/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FieldEmail extends StatelessWidget {
  final LoginController controller;
  const FieldEmail({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)),
        child: Observer(
          builder: (_) {
            return Theme(
              data: Theme.of(context).copyWith(primaryColor: Colors.blue[800]),
              child: CustonTextFormField(controller: controller),
            );
          },
        ));
  }
}

class CustonTextFormField extends StatelessWidget {
  const CustonTextFormField({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: !controller.getBusy,
      focusNode: controller.emailFocus,
      decoration: InputDecoration(
          hintText: 'E-mail',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.mail_outline)),
      cursorColor: Colors.blue[800],
      textAlignVertical: TextAlignVertical.center,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(controller.senhaFocus),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (controller.getWithErrorEmail) {
          controller.changeWithErrorEmail();
        }
      },
      validator: (value) {
        if ((value.isEmpty || !RegExp(emailValidator).hasMatch(value)) &&
            !controller.getWithErrorEmail) {
          controller.changeWithErrorEmail();
        }
        return null;
      },
      onSaved: ((val) {
        controller.loginModel.email = val;
      }),
    );
  }
}
