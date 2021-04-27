import 'package:despesas_app/app/app_controller.dart';
import 'package:despesas_app/app/model/login_model.dart';
import 'package:despesas_app/app/model/usuario_model.dart';
import 'package:despesas_app/app/services/auth_service.dart';
import 'package:despesas_app/app/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final service = Modular.get<AuthService>();
  final usuarioService = Modular.get<UsuarioService>();

  final _appController = Modular.get<AppController>();

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
    if (!_withErrorEmail && !_withErrorSenha) {
      changeBusy();
      formKey.currentState.save();

      await service.login(loginModel).then((value) async {
        UsuarioModel usuarioModel = await usuarioService.find();
        _aplyUserConfig(usuarioModel);

        Modular.to.pushReplacementNamed('/home');
      }).catchError((error) {
        changeBusy();
        print('ERRO AO FAZER LOGIN: ${error.toString()}');
        //TODO: implementar tratamento de erro
      });
    }
  }

  _aplyUserConfig(UsuarioModel usuarioModel) {
    if (usuarioModel.usuarioConfigModel.darkTheme &&
        !_appController.getDarkTheme) {
      _appController.changeDarkTheme();
    }
  }
}
