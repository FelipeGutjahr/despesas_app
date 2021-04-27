import 'package:despesas_app/app/pages/login/login_controller.dart';
import 'package:despesas_app/app/utils/constants.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('images/login_image.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bem-vindo ao aplicativo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                  blurRadius: 10,
                                  color: Colors.black54,
                                  offset: Offset(5, 5))
                            ])),
                    SizedBox(height: 50),
                    Container(
                      width: 425,
                      child: getForm(context),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget getForm(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          getFieldEmail(context),
          SizedBox(height: 2),
          getEmailError(),
          SizedBox(height: 10),
          getFieldSenha(context),
          SizedBox(height: 2),
          getSenhaError(),
          SizedBox(height: 30),
          getBtnEntrar(context),
          SizedBox(height: 10),
          getBtnEsqueciSenha()
        ],
      ),
    );
  }

  Widget getFieldEmail(BuildContext context) {
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
              child: TextFormField(
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
                  if ((value.isEmpty ||
                          !RegExp(emailValidator).hasMatch(value)) &&
                      !controller.getWithErrorEmail) {
                    controller.changeWithErrorEmail();
                  }
                  return null;
                },
                onSaved: ((val) {
                  controller.loginModel.email = val;
                }),
              ),
            );
          },
        ));
  }

  Widget getEmailError() {
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

  Widget getFieldSenha(BuildContext context) {
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

  Widget getSenhaError() {
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

  Widget getBtnEntrar(BuildContext context) {
    return Observer(builder: (_) {
      return CustonWidget.getElevatedButton(
          text: 'Iniciar Sessão',
          onPressed: () =>
              controller.getBusy ? null : controller.logar(context),
          busy: controller.getBusy);
    });
  }

  Widget getBtnEsqueciSenha() {
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
