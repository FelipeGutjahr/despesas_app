// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plano_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlanoController on _PlanoController, Store {
  Computed<bool> _$getBusyComputed;

  @override
  bool get getBusy => (_$getBusyComputed ??=
          Computed<bool>(() => super.getBusy, name: '_PlanoController.getBusy'))
      .value;

  final _$_busyAtom = Atom(name: '_PlanoController._busy');

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

  final _$_PlanoControllerActionController =
      ActionController(name: '_PlanoController');

  @override
  void changeBusy() {
    final _$actionInfo = _$_PlanoControllerActionController.startAction(
        name: '_PlanoController.changeBusy');
    try {
      return super.changeBusy();
    } finally {
      _$_PlanoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getBusy: ${getBusy}
    ''';
  }
}
