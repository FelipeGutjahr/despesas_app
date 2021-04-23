import 'package:despesas_app/app/model/usuario_model.dart';
import 'package:despesas_app/app/services/usuario_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'settings_controller.g.dart';

class SettingsController = _SettingsController with _$SettingsController;

abstract class _SettingsController with Store {
  _SettingsController() {
    find();
  }

  final _usuarioService = Modular.get<UsuarioService>();

  UsuarioModel usuarioModel = UsuarioModel();

  @observable
  bool _busy = false;

  @observable
  bool _loadingData = true;

  @observable
  bool _custonDayMonth = false;

  @action
  void changeBusy() => _busy = !_busy;

  @action
  void changeCustonDayMonth() => _custonDayMonth = !_custonDayMonth;

  @action
  void changeLoadingData() => _loadingData = !_loadingData;

  @computed
  bool get getBusy => _busy;

  @computed
  bool get getCustonDayMonth => _custonDayMonth;

  @computed
  bool get getLoadingData => _loadingData;

  find() async {
    usuarioModel = await _usuarioService.find();
    if (usuarioModel.usuarioConfigModel.primeiroDiaMes != null)
      changeCustonDayMonth();
    changeLoadingData();
  }

  salvar() async {
    changeBusy();
    await Future.delayed(Duration(seconds: 3));
    changeBusy();
  }
}
