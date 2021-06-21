// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novo_portador_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NovoPortadorController on _NovoPortadorController, Store {
  Computed<bool> _$getBusyComputed;

  @override
  bool get getBusy => (_$getBusyComputed ??= Computed<bool>(() => super.getBusy,
          name: '_NovoPortadorController.getBusy'))
      .value;
  Computed<List<PlanoModel>> _$getPlanosComputed;

  @override
  List<PlanoModel> get getPlanos =>
      (_$getPlanosComputed ??= Computed<List<PlanoModel>>(() => super.getPlanos,
              name: '_NovoPortadorController.getPlanos'))
          .value;
  Computed<bool> _$getHasCreditoComputed;

  @override
  bool get getHasCredito =>
      (_$getHasCreditoComputed ??= Computed<bool>(() => super.getHasCredito,
              name: '_NovoPortadorController.getHasCredito'))
          .value;

  final _$_busyAtom = Atom(name: '_NovoPortadorController._busy');

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

  final _$_contasAtom = Atom(name: '_NovoPortadorController._contas');

  @override
  List<PlanoModel> get _contas {
    _$_contasAtom.reportRead();
    return super._contas;
  }

  @override
  set _contas(List<PlanoModel> value) {
    _$_contasAtom.reportWrite(value, super._contas, () {
      super._contas = value;
    });
  }

  final _$_hasCreditoAtom = Atom(name: '_NovoPortadorController._hasCredito');

  @override
  bool get _hasCredito {
    _$_hasCreditoAtom.reportRead();
    return super._hasCredito;
  }

  @override
  set _hasCredito(bool value) {
    _$_hasCreditoAtom.reportWrite(value, super._hasCredito, () {
      super._hasCredito = value;
    });
  }

  final _$_NovoPortadorControllerActionController =
      ActionController(name: '_NovoPortadorController');

  @override
  void changeBusy() {
    final _$actionInfo = _$_NovoPortadorControllerActionController.startAction(
        name: '_NovoPortadorController.changeBusy');
    try {
      return super.changeBusy();
    } finally {
      _$_NovoPortadorControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setPlanos(List<PlanoModel> data) {
    final _$actionInfo = _$_NovoPortadorControllerActionController.startAction(
        name: '_NovoPortadorController._setPlanos');
    try {
      return super._setPlanos(data);
    } finally {
      _$_NovoPortadorControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeHasCredito() {
    final _$actionInfo = _$_NovoPortadorControllerActionController.startAction(
        name: '_NovoPortadorController.changeHasCredito');
    try {
      return super.changeHasCredito();
    } finally {
      _$_NovoPortadorControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getBusy: ${getBusy},
getPlanos: ${getPlanos},
getHasCredito: ${getHasCredito}
    ''';
  }
}
