// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duplicata_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DuplicataController on _DuplicataController, Store {
  Computed<bool> _$getBusyComputed;

  @override
  bool get getBusy => (_$getBusyComputed ??= Computed<bool>(() => super.getBusy,
          name: '_DuplicataController.getBusy'))
      .value;
  Computed<bool> _$getReceberComputed;

  @override
  bool get getReceber =>
      (_$getReceberComputed ??= Computed<bool>(() => super.getReceber,
              name: '_DuplicataController.getReceber'))
          .value;
  Computed<bool> _$getPagarComputed;

  @override
  bool get getPagar =>
      (_$getPagarComputed ??= Computed<bool>(() => super.getPagar,
              name: '_DuplicataController.getPagar'))
          .value;

  final _$_busyAtom = Atom(name: '_DuplicataController._busy');

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

  final _$_receberAtom = Atom(name: '_DuplicataController._receber');

  @override
  bool get _receber {
    _$_receberAtom.reportRead();
    return super._receber;
  }

  @override
  set _receber(bool value) {
    _$_receberAtom.reportWrite(value, super._receber, () {
      super._receber = value;
    });
  }

  final _$_pagarAtom = Atom(name: '_DuplicataController._pagar');

  @override
  bool get _pagar {
    _$_pagarAtom.reportRead();
    return super._pagar;
  }

  @override
  set _pagar(bool value) {
    _$_pagarAtom.reportWrite(value, super._pagar, () {
      super._pagar = value;
    });
  }

  final _$_DuplicataControllerActionController =
      ActionController(name: '_DuplicataController');

  @override
  void changeBusy() {
    final _$actionInfo = _$_DuplicataControllerActionController.startAction(
        name: '_DuplicataController.changeBusy');
    try {
      return super.changeBusy();
    } finally {
      _$_DuplicataControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeReceber() {
    final _$actionInfo = _$_DuplicataControllerActionController.startAction(
        name: '_DuplicataController.changeReceber');
    try {
      return super.changeReceber();
    } finally {
      _$_DuplicataControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePagar() {
    final _$actionInfo = _$_DuplicataControllerActionController.startAction(
        name: '_DuplicataController.changePagar');
    try {
      return super.changePagar();
    } finally {
      _$_DuplicataControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getBusy: ${getBusy},
getReceber: ${getReceber},
getPagar: ${getPagar}
    ''';
  }
}
