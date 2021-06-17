import 'package:despesas_app/app/pages/login/components/field_email.dart';
import 'package:despesas_app/app/pages/login/components/field_senha.dart';
import 'package:despesas_app/app/pages/login/login_controller.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustonForm extends StatelessWidget {
  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 425.0,
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FieldEmail(controller: controller),
            SizedBox(height: 2),
            EmailError(controller: controller),
            SizedBox(height: 10),
            FieldSenha(controller: controller),
            SizedBox(height: 2),
            SenhaError(controller: controller),
            SizedBox(height: 30),
            BtnEntrar(controller: controller),
            SizedBox(height: 10),
            BtnSenha()
          ],
        ),
      ),
    );
  }
}

class BtnSenha extends StatelessWidget {
  const BtnSenha({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('Esqueci minha senha',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, shadows: [
            Shadow(blurRadius: 10, color: Colors.black54, offset: Offset(5, 5))
          ])),
      onPressed: null,
    );
  }
}

class BtnEntrar extends StatelessWidget {
  const BtnEntrar({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return CustonWidget.getElevatedButton(
          text: 'Iniciar Sessão',
          onPressed: () =>
              controller.getBusy ? null : controller.logar(context),
          busy: controller.getBusy);
    });
  }
}

class SenhaError extends StatelessWidget {
  const SenhaError({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return controller.getWithErrorSenha
            ? Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red),
                  SizedBox(width: 5),
                  Text('Senha inválida', style: TextStyle(color: Colors.red))
                ],
              )
            : Container(height: 0, width: 0);
      },
    );
  }
}

class EmailError extends StatelessWidget {
  const EmailError({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return controller.getWithErrorEmail
            ? Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red),
                  SizedBox(width: 5),
                  Text('E-mail inválido', style: TextStyle(color: Colors.red))
                ],
              )
            : Container(height: 0, width: 0);
      },
    );
  }
}
