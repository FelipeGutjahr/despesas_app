// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppController, Store {
  Computed<bool> _$getDarkThemeComputed;

  @override
  bool get getDarkTheme =>
      (_$getDarkThemeComputed ??= Computed<bool>(() => super.getDarkTheme,
              name: '_AppController.getDarkTheme'))
          .value;

  final _$_darkThemeAtom = Atom(name: '_AppController._darkTheme');

  @override
  bool get _darkTheme {
    _$_darkThemeAtom.reportRead();
    return super._darkTheme;
  }

  @override
  set _darkTheme(bool value) {
    _$_darkThemeAtom.reportWrite(value, super._darkTheme, () {
      super._darkTheme = value;
    });
  }

  final _$_AppControllerActionController =
      ActionController(name: '_AppController');

  @override
  void changeDarkTheme() {
    final _$actionInfo = _$_AppControllerActionController.startAction(
        name: '_AppController.changeDarkTheme');
    try {
      return super.changeDarkTheme();
    } finally {
      _$_AppControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getDarkTheme: ${getDarkTheme}
    ''';
  }
}
