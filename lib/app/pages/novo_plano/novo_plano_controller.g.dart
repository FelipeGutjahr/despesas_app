// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novo_plano_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NovoPlanoController on _NovoPlanoController, Store {
  Computed<bool> _$getIsDreComputed;

  @override
  bool get getIsDre =>
      (_$getIsDreComputed ??= Computed<bool>(() => super.getIsDre,
              name: '_NovoPlanoController.getIsDre'))
          .value;

  final _$_isDreAtom = Atom(name: '_NovoPlanoController._isDre');

  @override
  bool get _isDre {
    _$_isDreAtom.reportRead();
    return super._isDre;
  }

  @override
  set _isDre(bool value) {
    _$_isDreAtom.reportWrite(value, super._isDre, () {
      super._isDre = value;
    });
  }

  final _$_NovoPlanoControllerActionController =
      ActionController(name: '_NovoPlanoController');

  @override
  void changeIsDre() {
    final _$actionInfo = _$_NovoPlanoControllerActionController.startAction(
        name: '_NovoPlanoController.changeIsDre');
    try {
      return super.changeIsDre();
    } finally {
      _$_NovoPlanoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getIsDre: ${getIsDre}
    ''';
  }
}
