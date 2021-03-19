import 'package:despesas_app/app/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  
  final formKey = GlobalKey<FormState>();
  
  var emailFocus = new FocusNode();
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
  void changeObscurePassword() => _obscurePassword = !_obscurePassword;

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
    formKey.currentState.validate();
    if(!_withErrorEmail && !_withErrorSenha) {
      changeBusy();
      await Future.delayed(Duration(seconds: 3));
      formKey.currentState.save();
      if(loginModel.email == '@' && loginModel.senha == '@'){
        Modular.to.pushReplacementNamed('/home');
        changeBusy();
        if(!getObscurePassword){
          changeObscurePassword();
        }
      } else {
        changeBusy();
      }
    }
  }
}