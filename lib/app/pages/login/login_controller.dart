import 'package:despesas_app/app/app_controller.dart';
import 'package:despesas_app/app/model/login_model.dart';
import 'package:despesas_app/app/model/usuario_model.dart';
import 'package:despesas_app/app/services/auth_service.dart';
import 'package:despesas_app/app/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @observable
  String _errorMessage = '';

  @action
  void changeObscurePassword() => _obscurePassword = !_obscurePassword;

  @action
  void changeBusy() => _busy = !_busy;

  @action
  void changeWithErrorEmail() => _withErrorEmail = !_withErrorEmail;

  @action
  void changeWithErrorSenha() => _withErrorSenha = !_withErrorSenha;

  @action
  void setErrorMessage(String message) => _errorMessage = message;

  @computed
  bool get getObscurePassword => _obscurePassword;

  @computed
  bool get getBusy => _busy;

  @computed
  bool get getWithErrorEmail => _withErrorEmail;

  @computed
  bool get getWithErrorSenha => _withErrorSenha;

  @computed
  String get getErrorMessage => _errorMessage;

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
        setErrorMessage(error.toString());
      });
    }
  }

  _aplyUserConfig(UsuarioModel usuarioModel) async {
    if (usuarioModel.usuarioConfigModel.darkTheme &&
        !_appController.getDarkTheme) {
      _appController.changeDarkTheme();
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('dark_theme', usuarioModel.usuarioConfigModel.darkTheme);
  }
}
