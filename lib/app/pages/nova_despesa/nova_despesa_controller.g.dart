// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nova_despesa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NovaDespesaController on _NovaDespesaController, Store {
  Computed<bool> _$getBusyComputed;

  @override
  bool get getBusy => (_$getBusyComputed ??= Computed<bool>(() => super.getBusy,
          name: '_NovaDespesaController.getBusy'))
      .value;
  Computed<bool> _$getDuplicataComputed;

  @override
  bool get getDuplicata =>
      (_$getDuplicataComputed ??= Computed<bool>(() => super.getDuplicata,
              name: '_NovaDespesaController.getDuplicata'))
          .value;
  Computed<List<PortadorModel>> _$getPortadoresComputed;

  @override
  List<PortadorModel> get getPortadores => (_$getPortadoresComputed ??=
          Computed<List<PortadorModel>>(() => super.getPortadores,
              name: '_NovaDespesaController.getPortadores'))
      .value;
  Computed<List<PlanoModel>> _$getPlanosComputed;

  @override
  List<PlanoModel> get getPlanos =>
      (_$getPlanosComputed ??= Computed<List<PlanoModel>>(() => super.getPlanos,
              name: '_NovaDespesaController.getPlanos'))
          .value;
  Computed<bool> _$getPortadorHasCreditoComputed;

  @override
  bool get getPortadorHasCredito => (_$getPortadorHasCreditoComputed ??=
          Computed<bool>(() => super.getPortadorHasCredito,
              name: '_NovaDespesaController.getPortadorHasCredito'))
      .value;
  Computed<bool> _$getIsCreditoComputed;

  @override
  bool get getIsCredito =>
      (_$getIsCreditoComputed ??= Computed<bool>(() => super.getIsCredito,
              name: '_NovaDespesaController.getIsCredito'))
          .value;
  Computed<bool> _$getIsParceladoComputed;

  @override
  bool get getIsParcelado =>
      (_$getIsParceladoComputed ??= Computed<bool>(() => super.getIsParcelado,
              name: '_NovaDespesaController.getIsParcelado'))
          .value;
  Computed<int> _$getQtdParcelasComputed;

  @override
  int get getQtdParcelas =>
      (_$getQtdParcelasComputed ??= Computed<int>(() => super.getQtdParcelas,
              name: '_NovaDespesaController.getQtdParcelas'))
          .value;

  final _$_busyAtom = Atom(name: '_NovaDespesaController._busy');

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

  final _$_duplicataAtom = Atom(name: '_NovaDespesaController._duplicata');

  @override
  bool get _duplicata {
    _$_duplicataAtom.reportRead();
    return super._duplicata;
  }

  @override
  set _duplicata(bool value) {
    _$_duplicataAtom.reportWrite(value, super._duplicata, () {
      super._duplicata = value;
    });
  }

  final _$_portadoresAtom = Atom(name: '_NovaDespesaController._portadores');

  @override
  List<PortadorModel> get _portadores {
    _$_portadoresAtom.reportRead();
    return super._portadores;
  }

  @override
  set _portadores(List<PortadorModel> value) {
    _$_portadoresAtom.reportWrite(value, super._portadores, () {
      super._portadores = value;
    });
  }

  final _$_contasAtom = Atom(name: '_NovaDespesaController._contas');

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

  final _$_portadorHasCreditoAtom =
      Atom(name: '_NovaDespesaController._portadorHasCredito');

  @override
  bool get _portadorHasCredito {
    _$_portadorHasCreditoAtom.reportRead();
    return super._portadorHasCredito;
  }

  @override
  set _portadorHasCredito(bool value) {
    _$_portadorHasCreditoAtom.reportWrite(value, super._portadorHasCredito, () {
      super._portadorHasCredito = value;
    });
  }

  final _$_isCreditoAtom = Atom(name: '_NovaDespesaController._isCredito');

  @override
  bool get _isCredito {
    _$_isCreditoAtom.reportRead();
    return super._isCredito;
  }

  @override
  set _isCredito(bool value) {
    _$_isCreditoAtom.reportWrite(value, super._isCredito, () {
      super._isCredito = value;
    });
  }

  final _$_isParceladoAtom = Atom(name: '_NovaDespesaController._isParcelado');

  @override
  bool get _isParcelado {
    _$_isParceladoAtom.reportRead();
    return super._isParcelado;
  }

  @override
  set _isParcelado(bool value) {
    _$_isParceladoAtom.reportWrite(value, super._isParcelado, () {
      super._isParcelado = value;
    });
  }

  final _$_qtdParcelasAtom = Atom(name: '_NovaDespesaController._qtdParcelas');

  @override
  int get _qtdParcelas {
    _$_qtdParcelasAtom.reportRead();
    return super._qtdParcelas;
  }

  @override
  set _qtdParcelas(int value) {
    _$_qtdParcelasAtom.reportWrite(value, super._qtdParcelas, () {
      super._qtdParcelas = value;
    });
  }

  final _$_NovaDespesaControllerActionController =
      ActionController(name: '_NovaDespesaController');

  @override
  void changeBusy() {
    final _$actionInfo = _$_NovaDespesaControllerActionController.startAction(
        name: '_NovaDespesaController.changeBusy');
    try {
      return super.changeBusy();
    } finally {
      _$_NovaDespesaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDuplicata() {
    final _$actionInfo = _$_NovaDespesaControllerActionController.startAction(
        name: '_NovaDespesaController.changeDuplicata');
    try {
      return super.changeDuplicata();
    } finally {
      _$_NovaDespesaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setPortadores(List<PortadorModel> data) {
    final _$actionInfo = _$_NovaDespesaControllerActionController.startAction(
        name: '_NovaDespesaController._setPortadores');
    try {
      return super._setPortadores(data);
    } finally {
      _$_NovaDespesaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setPlanos(List<PlanoModel> data) {
    final _$actionInfo = _$_NovaDespesaControllerActionController.startAction(
        name: '_NovaDespesaController._setPlanos');
    try {
      return super._setPlanos(data);
    } finally {
      _$_NovaDespesaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPortadorHasCredito(bool value) {
    final _$actionInfo = _$_NovaDespesaControllerActionController.startAction(
        name: '_NovaDespesaController.setPortadorHasCredito');
    try {
      return super.setPortadorHasCredito(value);
    } finally {
      _$_NovaDespesaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeisCredito() {
    final _$actionInfo = _$_NovaDespesaControllerActionController.startAction(
        name: '_NovaDespesaController.changeisCredito');
    try {
      return super.changeisCredito();
    } finally {
      _$_NovaDespesaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsParcelado() {
    final _$actionInfo = _$_NovaDespesaControllerActionController.startAction(
        name: '_NovaDespesaController.changeIsParcelado');
    try {
      return super.changeIsParcelado();
    } finally {
      _$_NovaDespesaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQtdParcelas(String parcelas) {
    final _$actionInfo = _$_NovaDespesaControllerActionController.startAction(
        name: '_NovaDespesaController.setQtdParcelas');
    try {
      return super.setQtdParcelas(parcelas);
    } finally {
      _$_NovaDespesaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getBusy: ${getBusy},
getDuplicata: ${getDuplicata},
getPortadores: ${getPortadores},
getPlanos: ${getPlanos},
getPortadorHasCredito: ${getPortadorHasCredito},
getIsCredito: ${getIsCredito},
getIsParcelado: ${getIsParcelado},
getQtdParcelas: ${getQtdParcelas}
    ''';
  }
}
