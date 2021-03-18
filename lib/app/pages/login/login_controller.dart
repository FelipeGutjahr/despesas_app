import 'package:despesas_app/app/model/login_model.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  
  final formKey = GlobalKey<FormState>();
  var senhaFocus = new FocusNode();

  LoginModel loginModel = LoginModel();

  @observable
  bool _obscurePassword = true;

  @observable
  bool _busy = false;

  @observable
  bool _withErrorEmail = false;

  @observable
  bool _withErrorSenha = false;
  
  @action
  void changeObscure() => _obscurePassword = !_obscurePassword;

  @action
  void changeBusy() => _busy = !_busy;

  @action
  void changeWithErrorEmail() => _withErrorEmail = !_withErrorEmail;

  @action
  void changeWithErrorSenha() => _withErrorSenha = !_withErrorSenha;

  @computed
  bool get getObscurePassword => _obscurePassword;

  @computed
  bool get getBusy => _busy;

  @computed
  bool get getWithErrorEmail => _withErrorEmail;

  @computed
  bool get getWithErrorSenha => _withErrorSenha;

  logar(BuildContext context) async {
    if(formKey.currentState.validate()) {
      changeBusy();
      await Future.delayed(Duration(seconds: 10));
      formKey.currentState.save();
      if(loginModel.email == 'gutjahrfelipe@gmail.com' && loginModel.senha == '123456'){
        Modular.to.pushReplacementNamed('/home');
      } else {
        changeBusy();
        CustonWidget.showAlertDialog(
          context: context,
          title: 'E-mail ou senha inválidos',
          bodyText: null,
          textConfirmBtn: 'OK',
          onPressed: null
        );
      }
    }
  }
}