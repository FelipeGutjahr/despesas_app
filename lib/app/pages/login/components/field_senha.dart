import 'package:despesas_app/app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FieldSenha extends StatelessWidget {
  final LoginController controller;
  const FieldSenha({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)),
      child: Observer(builder: (_) {
        return Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.blue[800]),
          child: TextFormField(
            enabled: !controller.getBusy,
            focusNode: controller.senhaFocus,
            obscureText: controller.getObscurePassword,
            cursorColor: Colors.blue[800],
            decoration: InputDecoration(
                hintText: 'Senha',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                    icon: Icon(controller.getObscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () => controller.changeObscurePassword())),
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) {
              if (controller.getWithErrorSenha) {
                controller.changeWithErrorSenha();
              }
            },
            validator: (value) {
              if (value.isEmpty && !controller.getWithErrorSenha) {
                controller.changeWithErrorSenha();
              }
              return null;
            },
            onSaved: ((val) {
              controller.loginModel.senha = val;
            }),
          ),
        );
      }),
    );
  }
}
