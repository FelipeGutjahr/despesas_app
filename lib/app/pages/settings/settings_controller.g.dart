// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsController on _SettingsController, Store {
  Computed<bool> _$getBusyComputed;

  @override
  bool get getBusy => (_$getBusyComputed ??= Computed<bool>(() => super.getBusy,
          name: '_SettingsController.getBusy'))
      .value;
  Computed<bool> _$getCustonDayMonthComputed;

  @override
  bool get getCustonDayMonth => (_$getCustonDayMonthComputed ??= Computed<bool>(
          () => super.getCustonDayMonth,
          name: '_SettingsController.getCustonDayMonth'))
      .value;
  Computed<bool> _$getLoadingDataComputed;

  @override
  bool get getLoadingData =>
      (_$getLoadingDataComputed ??= Computed<bool>(() => super.getLoadingData,
              name: '_SettingsController.getLoadingData'))
          .value;

  final _$_busyAtom = Atom(name: '_SettingsController._busy');

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

  final _$_loadingDataAtom = Atom(name: '_SettingsController._loadingData');

  @override
  bool get _loadingData {
    _$_loadingDataAtom.reportRead();
    return super._loadingData;
  }

  @override
  set _loadingData(bool value) {
    _$_loadingDataAtom.reportWrite(value, super._loadingData, () {
      super._loadingData = value;
    });
  }

  final _$_custonDayMonthAtom =
      Atom(name: '_SettingsController._custonDayMonth');

  @override
  bool get _custonDayMonth {
    _$_custonDayMonthAtom.reportRead();
    return super._custonDayMonth;
  }

  @override
  set _custonDayMonth(bool value) {
    _$_custonDayMonthAtom.reportWrite(value, super._custonDayMonth, () {
      super._custonDayMonth = value;
    });
  }

  final _$_SettingsControllerActionController =
      ActionController(name: '_SettingsController');

  @override
  void changeBusy() {
    final _$actionInfo = _$_SettingsControllerActionController.startAction(
        name: '_SettingsController.changeBusy');
    try {
      return super.changeBusy();
    } finally {
      _$_SettingsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCustonDayMonth() {
    final _$actionInfo = _$_SettingsControllerActionController.startAction(
        name: '_SettingsController.changeCustonDayMonth');
    try {
      return super.changeCustonDayMonth();
    } finally {
      _$_SettingsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoadingData() {
    final _$actionInfo = _$_SettingsControllerActionController.startAction(
        name: '_SettingsController.changeLoadingData');
    try {
      return super.changeLoadingData();
    } finally {
      _$_SettingsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getBusy: ${getBusy},
getCustonDayMonth: ${getCustonDayMonth},
getLoadingData: ${getLoadingData}
    ''';
  }
}
