// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nova_receita_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NovaReceitaController on _NovaReceitaController, Store {
  Computed<bool> _$getBusyComputed;

  @override
  bool get getBusy => (_$getBusyComputed ??= Computed<bool>(() => super.getBusy,
          name: '_NovaReceitaController.getBusy'))
      .value;
  Computed<bool> _$getDuplicataComputed;

  @override
  bool get getDuplicata =>
      (_$getDuplicataComputed ??= Computed<bool>(() => super.getDuplicata,
              name: '_NovaReceitaController.getDuplicata'))
          .value;
  Computed<bool> _$getDuplicataSemRecebimentoPrevistoComputed;

  @override
  bool get getDuplicataSemRecebimentoPrevisto =>
      (_$getDuplicataSemRecebimentoPrevistoComputed ??= Computed<bool>(
              () => super.getDuplicataSemRecebimentoPrevisto,
              name:
                  '_NovaReceitaController.getDuplicataSemRecebimentoPrevisto'))
          .value;
  Computed<List<PortadorModel>> _$getPortadoresComputed;

  @override
  List<PortadorModel> get getPortadores => (_$getPortadoresComputed ??=
          Computed<List<PortadorModel>>(() => super.getPortadores,
              name: '_NovaReceitaController.getPortadores'))
      .value;
  Computed<List<PlanoModel>> _$getPlanosComputed;

  @override
  List<PlanoModel> get getPlanos =>
      (_$getPlanosComputed ??= Computed<List<PlanoModel>>(() => super.getPlanos,
              name: '_NovaReceitaController.getPlanos'))
          .value;

  final _$_busyAtom = Atom(name: '_NovaReceitaController._busy');

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

  final _$_duplicataAtom = Atom(name: '_NovaReceitaController._duplicata');

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

  final _$_duplicataSemRecebimentoPrevistoAtom =
      Atom(name: '_NovaReceitaController._duplicataSemRecebimentoPrevisto');

  @override
  bool get _duplicataSemRecebimentoPrevisto {
    _$_duplicataSemRecebimentoPrevistoAtom.reportRead();
    return super._duplicataSemRecebimentoPrevisto;
  }

  @override
  set _duplicataSemRecebimentoPrevisto(bool value) {
    _$_duplicataSemRecebimentoPrevistoAtom
        .reportWrite(value, super._duplicataSemRecebimentoPrevisto, () {
      super._duplicataSemRecebimentoPrevisto = value;
    });
  }

  final _$_portadoresAtom = Atom(name: '_NovaReceitaController._portadores');

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

  final _$_contasAtom = Atom(name: '_NovaReceitaController._contas');

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

  final _$_NovaReceitaControllerActionController =
      ActionController(name: '_NovaReceitaController');

  @override
  void changeBusy() {
    final _$actionInfo = _$_NovaReceitaControllerActionController.startAction(
        name: '_NovaReceitaController.changeBusy');
    try {
      return super.changeBusy();
    } finally {
      _$_NovaReceitaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDuplicata() {
    final _$actionInfo = _$_NovaReceitaControllerActionController.startAction(
        name: '_NovaReceitaController.changeDuplicata');
    try {
      return super.changeDuplicata();
    } finally {
      _$_NovaReceitaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDuplicataSemRecebimentoPrevisto() {
    final _$actionInfo = _$_NovaReceitaControllerActionController.startAction(
        name: '_NovaReceitaController.changeDuplicataSemRecebimentoPrevisto');
    try {
      return super.changeDuplicataSemRecebimentoPrevisto();
    } finally {
      _$_NovaReceitaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setPortadores(List<PortadorModel> data) {
    final _$actionInfo = _$_NovaReceitaControllerActionController.startAction(
        name: '_NovaReceitaController._setPortadores');
    try {
      return super._setPortadores(data);
    } finally {
      _$_NovaReceitaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setPlanos(List<PlanoModel> data) {
    final _$actionInfo = _$_NovaReceitaControllerActionController.startAction(
        name: '_NovaReceitaController._setPlanos');
    try {
      return super._setPlanos(data);
    } finally {
      _$_NovaReceitaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getBusy: ${getBusy},
getDuplicata: ${getDuplicata},
getDuplicataSemRecebimentoPrevisto: ${getDuplicataSemRecebimentoPrevisto},
getPortadores: ${getPortadores},
getPlanos: ${getPlanos}
    ''';
  }
}
