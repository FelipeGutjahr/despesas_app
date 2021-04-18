import 'package:despesas_app/app/model/lancamento_model.dart';
import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/model/portador_model.dart';
import 'package:despesas_app/app/services/lancamento_service.dart';
import 'package:despesas_app/app/services/plano_service.dart';
import 'package:despesas_app/app/services/portador_service.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'novo_lancamento_controller.g.dart';

class NovoLancamentoController = _NovoLancamentoController
    with _$NovoLancamentoController;

abstract class _NovoLancamentoController with Store {
  final lancamentoService = Modular.get<LancamentoService>();

  final portadorService = Modular.get<PortadorService>();

  final planoService = Modular.get<PlanoService>();

  _NovoLancamentoController() {
    findPortadores();
    findContas();
  }

  final formKey = GlobalKey<FormState>();

  var valorFocus = new FocusNode();
  var historicoFocus = new FocusNode();

  var maskFormatterData = TextInputMask(mask: '99/99/9999');

  var maskFormatterValor = TextInputMask(
      mask: '9+999.999.999.999,99',
      reverse: true,
      placeholder: '0',
      maxPlaceHolders: 3);

  var makFormaterParcelas = TextInputMask(mask: '9+9');

  /* DateTime data = DateTime.now(); */

  LancamentoModel lancamentoModel =
      LancamentoModel(isCredito: false, isParcelado: false, qtdParcelas: 0);

  @observable
  List<PortadorModel> _portadores = <PortadorModel>[];

  @observable
  List<PlanoModel> _contas = <PlanoModel>[];

  @observable
  bool _busy = false;

  @observable
  bool _receita = false;

  @observable
  bool _isCredito = false;

  @observable
  bool _isParcelado = false;

  @observable
  int _qtdParcelas = 0;

  @observable
  double _valor = 0;

  @action
  void _setPortadores(List<PortadorModel> data) => _portadores = data;

  @action
  void _setPlanos(List<PlanoModel> data) => _contas = data;

  @action
  void changeBusy() => _busy = !_busy;

  @action
  void changeReceita() => _receita = !_receita;

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

  @action
  void setValor(String valor) {
    valor == null
        ? _valor = 0
        : _valor = double.parse(
            valor.replaceAll(RegExp(r'\.'), '').replaceAll(RegExp(r','), '.'));
    lancamentoModel.valor = _valor;
  }

  @computed
  List<PortadorModel> get getPortadores => _portadores;

  @computed
  List<PlanoModel> get getContas => _contas;

  @computed
  bool get getBusy => _busy;

  @computed
  bool get getReceita => _receita;

  @computed
  bool get getIsCredito => _isCredito;

  @computed
  bool get getIsParcelado => _isParcelado;

  @computed
  int get getQtdParcelas => _qtdParcelas;

  @computed
  String get getResultadoParcelas {
    if (_valor != 0 && _qtdParcelas != 0)
      return (_valor / _qtdParcelas)
          .toStringAsFixed(2)
          .replaceAll(RegExp(r'\.'), ',');
    else
      return null;
  }

  findPortadores() async {
    List<PortadorModel> list = await portadorService.findAll();
    _setPortadores(list);
  }

  findContas() async {
    List<PlanoModel> list = await planoService.findAll();
    _setPlanos(list);
  }

  salvar() {
    formKey.currentState.save();
    if (formKey.currentState.validate()) {
      lancamentoService.salvar(lancamentoModel);
    }
  }
}
