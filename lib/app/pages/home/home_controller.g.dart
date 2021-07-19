// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  Computed<bool> _$getShowDrawerComputed;

  @override
  bool get getShowDrawer =>
      (_$getShowDrawerComputed ??= Computed<bool>(() => super.getShowDrawer,
              name: '_HomeController.getShowDrawer'))
          .value;
  Computed<bool> _$getBusyComputed;

  @override
  bool get getBusy => (_$getBusyComputed ??=
          Computed<bool>(() => super.getBusy, name: '_HomeController.getBusy'))
      .value;
  Computed<bool> _$getSelectItem1Computed;

  @override
  bool get getSelectItem1 =>
      (_$getSelectItem1Computed ??= Computed<bool>(() => super.getSelectItem1,
              name: '_HomeController.getSelectItem1'))
          .value;
  Computed<bool> _$getSelectItem2Computed;

  @override
  bool get getSelectItem2 =>
      (_$getSelectItem2Computed ??= Computed<bool>(() => super.getSelectItem2,
              name: '_HomeController.getSelectItem2'))
          .value;
  Computed<bool> _$getExpandedPanel1Computed;

  @override
  bool get getExpandedPanel1 => (_$getExpandedPanel1Computed ??= Computed<bool>(
          () => super.getExpandedPanel1,
          name: '_HomeController.getExpandedPanel1'))
      .value;

  final _$_showDrawerAtom = Atom(name: '_HomeController._showDrawer');

  @override
  bool get _showDrawer {
    _$_showDrawerAtom.reportRead();
    return super._showDrawer;
  }

  @override
  set _showDrawer(bool value) {
    _$_showDrawerAtom.reportWrite(value, super._showDrawer, () {
      super._showDrawer = value;
    });
  }

  final _$_busyAtom = Atom(name: '_HomeController._busy');

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

  final _$_selectItem1Atom = Atom(name: '_HomeController._selectItem1');

  @override
  bool get _selectItem1 {
    _$_selectItem1Atom.reportRead();
    return super._selectItem1;
  }

  @override
  set _selectItem1(bool value) {
    _$_selectItem1Atom.reportWrite(value, super._selectItem1, () {
      super._selectItem1 = value;
    });
  }

  final _$_selectItem2Atom = Atom(name: '_HomeController._selectItem2');

  @override
  bool get _selectItem2 {
    _$_selectItem2Atom.reportRead();
    return super._selectItem2;
  }

  @override
  set _selectItem2(bool value) {
    _$_selectItem2Atom.reportWrite(value, super._selectItem2, () {
      super._selectItem2 = value;
    });
  }

  final _$_expandedPanel1Atom = Atom(name: '_HomeController._expandedPanel1');

  @override
  bool get _expandedPanel1 {
    _$_expandedPanel1Atom.reportRead();
    return super._expandedPanel1;
  }

  @override
  set _expandedPanel1(bool value) {
    _$_expandedPanel1Atom.reportWrite(value, super._expandedPanel1, () {
      super._expandedPanel1 = value;
    });
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  void changeShowDrawer() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.changeShowDrawer');
    try {
      return super.changeShowDrawer();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBusy() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.changeBusy');
    try {
      return super.changeBusy();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectItem1() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.changeSelectItem1');
    try {
      return super.changeSelectItem1();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectItem2() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.changeSelectItem2');
    try {
      return super.changeSelectItem2();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeExpandedPanel1() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.changeExpandedPanel1');
    try {
      return super.changeExpandedPanel1();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getShowDrawer: ${getShowDrawer},
getBusy: ${getBusy},
getSelectItem1: ${getSelectItem1},
getSelectItem2: ${getSelectItem2},
getExpandedPanel1: ${getExpandedPanel1}
    ''';
  }
}
