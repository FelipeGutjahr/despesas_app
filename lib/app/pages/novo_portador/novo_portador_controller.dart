import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/model/portador_model.dart';
import 'package:despesas_app/app/services/plano_service.dart';
import 'package:despesas_app/app/services/portador_service.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'novo_portador_controller.g.dart';

class NovoPortadorController = _NovoPortadorController
    with _$NovoPortadorController;

abstract class _NovoPortadorController with Store {
  _NovoPortadorController() {
    findContas();
  }

  var maskLimite = TextInputMask(mask: '9+9');

  final _portadorService = Modular.get<PortadorService>();
  final _planoService = Modular.get<PlanoService>();

  final formKey = GlobalKey<FormState>();

  TextEditingController planoController = TextEditingController();

  PortadorModel portadorModel = PortadorModel();

  @observable
  bool _busy = false;

  @observable
  List<PlanoModel> _contas = <PlanoModel>[];

  @observable
  bool _hasCredito = false;

  @action
  void changeBusy() => _busy = !_busy;

  @action
  void _setPlanos(List<PlanoModel> data) => _contas = data;

  @action
  void changeHasCredito() => _hasCredito = !_hasCredito;

  @computed
  bool get getBusy => _busy;

  @computed
  List<PlanoModel> get getPlanos => _contas;

  @computed
  bool get getHasCredito => _hasCredito;

  findContas() async {
    List<PlanoModel> list = await _planoService.findAll();
    _setPlanos(list);
  }

  salvarTeste() async {
    print('cliclou');
    changeBusy();
    await Future.delayed(Duration(seconds: 5));
    changeBusy();
  }

  salvar() async {
    changeBusy();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      portadorModel.credito = _hasCredito;
      await _portadorService.salvar(portadorModel);
      Modular.to.pop();
    }
    changeBusy();
  }
}
