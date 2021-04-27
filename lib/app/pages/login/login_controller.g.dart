// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  Computed<bool> _$getObscurePasswordComputed;

  @override
  bool get getObscurePassword => (_$getObscurePasswordComputed ??=
          Computed<bool>(() => super.getObscurePassword,
              name: '_LoginController.getObscurePassword'))
      .value;
  Computed<bool> _$getBusyComputed;

  @override
  bool get getBusy => (_$getBusyComputed ??=
          Computed<bool>(() => super.getBusy, name: '_LoginController.getBusy'))
      .value;
  Computed<bool> _$getWithErrorEmailComputed;

  @override
  bool get getWithErrorEmail => (_$getWithErrorEmailComputed ??= Computed<bool>(
          () => super.getWithErrorEmail,
          name: '_LoginController.getWithErrorEmail'))
      .value;
  Computed<bool> _$getWithErrorSenhaComputed;

  @override
  bool get getWithErrorSenha => (_$getWithErrorSenhaComputed ??= Computed<bool>(
          () => super.getWithErrorSenha,
          name: '_LoginController.getWithErrorSenha'))
      .value;

  final _$_obscurePasswordAtom =
      Atom(name: '_LoginController._obscurePassword');

  @override
  bool get _obscurePassword {
    _$_obscurePasswordAtom.reportRead();
    return super._obscurePassword;
  }

  @override
  set _obscurePassword(bool value) {
    _$_obscurePasswordAtom.reportWrite(value, super._obscurePassword, () {
      super._obscurePassword = value;
    });
  }

  final _$_busyAtom = Atom(name: '_LoginController._busy');

  @override
  bool get _busy {
    _$_busyAtom.reportRead();
    return super._busy;
  }

  @override
  set _busy(bool value) {
    _$_busyAtom.reportWrite(value, super._busy, () {
      super._busy = value;
    });
  }

  final _$_withErrorEmailAtom = Atom(name: '_LoginController._withErrorEmail');

  @override
  bool get _withErrorEmail {
    _$_withErrorEmailAtom.reportRead();
    return super._withErrorEmail;
  }

  @override
  set _withErrorEmail(bool value) {
    _$_withErrorEmailAtom.reportWrite(value, super._withErrorEmail, () {
      super._withErrorEmail = value;
    });
  }

  final _$_withErrorSenhaAtom = Atom(name: '_LoginController._withErrorSenha');

  @override
  bool get _withErrorSenha {
    _$_withErrorSenhaAtom.reportRead();
    return super._withErrorSenha;
  }

  @override
  set _withErrorSenha(bool value) {
    _$_withErrorSenhaAtom.reportWrite(value, super._withErrorSenha, () {
      super._withErrorSenha = value;
    });
  }

  final _$_LoginControllerActionController =
      ActionController(name: '_LoginController');

  @override
  void changeObscurePassword() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.changeObscurePassword');
    try {
      return super.changeObscurePassword();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBusy() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.changeBusy');
    try {
      return super.changeBusy();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeWithErrorEmail() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.changeWithErrorEmail');
    try {
      return super.changeWithErrorEmail();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeWithErrorSenha() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.changeWithErrorSenha');
    try {
      return super.changeWithErrorSenha();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getObscurePassword: ${getObscurePassword},
getBusy: ${getBusy},
getWithErrorEmail: ${getWithErrorEmail},
getWithErrorSenha: ${getWithErrorSenha}
    ''';
  }
}
