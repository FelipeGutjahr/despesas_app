import 'package:despesas_app/app/model/duplicata_model.dart';
import 'package:despesas_app/app/model/lancamento_model.dart';
import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/model/portador_model.dart';
import 'package:despesas_app/app/services/duplicata_service.dart';
import 'package:despesas_app/app/services/lancamento_service.dart';
import 'package:despesas_app/app/services/plano_service.dart';
import 'package:despesas_app/app/services/portador_service.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'nova_despesa_controller.g.dart';

class NovaDespesaController = _NovaDespesaController
    with _$NovaDespesaController;

abstract class _NovaDespesaController with Store {
  _NovaDespesaController() {
    findPortadores();
    findContas();
  }

  resetAll() {
    portadorController.text = '';
    planoController.text = '';
    lancamentoModel = LancamentoModel();
    duplicataModel = DuplicataModel(receber: false);
  }

  final _lancamentoService = Modular.get<LancamentoService>();
  final _portadorService = Modular.get<PortadorService>();
  final _planoService = Modular.get<PlanoService>();
  final _duplicataService = Modular.get<DuplicataService>();

  final formKey = GlobalKey<FormState>();

  TextEditingController portadorController = TextEditingController();
  TextEditingController planoController = TextEditingController();

  var dataFocus = new FocusNode();
  var valorFocus = new FocusNode();
  var historicoFocus = new FocusNode();

  var maskFormatterData = TextInputMask(mask: '99/99/9999');

  var maskFormatterValor = TextInputMask(
      mask: '9+999.999.999.999,99',
      reverse: true,
      placeholder: '0',
      maxPlaceHolders: 3);

  var makFormaterParcelas = TextInputMask(mask: '9+9');

  LancamentoModel lancamentoModel = LancamentoModel();
  DuplicataModel duplicataModel = DuplicataModel(receber: false);

  @observable
  bool _busy = false;

  @observable
  bool _duplicata = false;

  @observable
  List<PortadorModel> _portadores = <PortadorModel>[];

  @observable
  List<PlanoModel> _contas = <PlanoModel>[];

  @observable
  bool _portadorHasCredito = false;

  @observable
  bool _isCredito = false;

  @observable
  bool _isParcelado = false;

  @observable
  int _qtdParcelas = 0;

  @action
  void changeBusy() => _busy = !_busy;

  @action
  void changeDuplicata() => {
        _duplicata = !_duplicata,
        if (_duplicata && _isCredito) changeisCredito()
      };

  @action
  void _setPortadores(List<PortadorModel> data) => _portadores = data;

  @action
  void _setPlanos(List<PlanoModel> data) => _contas = data;

  @action
  void setPortadorHasCredito(bool value) => {
        if (!value && getIsCredito) {changeisCredito()},
        _portadorHasCredito = value
      };

  @action
  void changeisCredito() {
    if (getIsParcelado) changeIsParcelado();
    _isCredito = !_isCredito;
    lancamentoModel.isCredito = _isCredito;
  }

  @action
  void changeIsParcelado() {
    setQtdParcelas('0');
    _isParcelado = !_isParcelado;
    lancamentoModel.isParcelado = _isParcelado;
  }

  @action
  void setQtdParcelas(String parcelas) {
    parcelas == null || parcelas == ''
        ? _qtdParcelas = 0
        : _qtdParcelas = int.parse(parcelas);
    lancamentoModel.qtdParcelas = _qtdParcelas;
  }

  @computed
  bool get getBusy => _busy;

  @computed
  bool get getDuplicata => _duplicata;

  @computed
  List<PortadorModel> get getPortadores => _portadores;

  @computed
  List<PlanoModel> get getPlanos => _contas;

  @computed
  bool get getPortadorHasCredito => _portadorHasCredito;

  @computed
  bool get getIsCredito => _isCredito;

  @computed
  bool get getIsParcelado => _isParcelado;

  @computed
  int get getQtdParcelas => _qtdParcelas;

  findPortadores() async {
    List<PortadorModel> data = await _portadorService.findAll();
    _setPortadores(data);
  }

  findContas() async {
    List<PlanoModel> list = await _planoService.findAll();
    _setPlanos(list);
  }

  salvarr() async {
    changeBusy();
    await Future.delayed(Duration(seconds: 5));
    changeBusy();
  }

  salvar() async {
    changeBusy();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      if (_duplicata) {
        await _duplicataService.salvar(duplicataModel);
      } else {
        await _lancamentoService.salvar(lancamentoModel);
      }
      Modular.to.pop();
    }
    changeBusy();
  }
}
