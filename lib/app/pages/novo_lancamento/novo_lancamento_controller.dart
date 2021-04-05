import 'package:despesas_app/app/model/lancamento_model.dart';
import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/model/portador_model.dart';
import 'package:despesas_app/app/utils/constants.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'novo_lancamento_controller.g.dart';

class NovoLancamentoController = _NovoLancamentoController with _$NovoLancamentoController;

abstract class _NovoLancamentoController with Store {
  
  _NovoLancamentoController(){
    findPortadores();
    findContas();
  }
  
  final formKey = GlobalKey<FormState>();
  
  var valorFocus = new FocusNode();
  var historicoFocus = new FocusNode();

  var maskFormatterData = TextInputMask(
    mask: '99/99/9999'
  );

  var maskFormatterValor = TextInputMask(
    mask: '9+999.999.999.999,99',
    reverse: true,
    placeholder: '0',
    maxPlaceHolders: 3
  );

  DateTime data = DateTime.now();

  LancamentoModel lancamentoModel = LancamentoModel();

  @observable
  List<PortadorModel> _portadores = <PortadorModel>[];

  @observable
  List<PlanoModel> _contas = <PlanoModel>[];

  @observable
  bool _busy = false;

  @observable
  bool _receita = true;

  @action
  void _setPortadores(List<PortadorModel> data) => _portadores = data;

  @action
  void _setPlanos(List<PlanoModel> data) => _contas = data;

  @action
  void changeBusy() => _busy = !_busy;

  @action
  void changeReceita() => _receita = !_receita;

  @computed
  List<PortadorModel> get getPortadores => _portadores;

  @computed
  List<PlanoModel> get getContas => _contas;

  @computed
  bool get getBusy => _busy;

  @computed
  bool get getReceita => _receita;

  findPortadores() {
    _setPortadores(retornoPortadores);
  }

  findContas() {
    _setPlanos(retornoContasPlano);
  }

  salvar() {
    if(formKey.currentState.validate()){
      //TODO: implementar código para salvar despesa/receita
    }
  }
}