import 'package:despesas_app/app/model/auto_complete_text_field_model.dart';
import 'package:despesas_app/app/model/lancamento_model.dart';
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
  List<AutoCompleteTextFieldModel> _portadores = <AutoCompleteTextFieldModel>[];

  @observable
  List<AutoCompleteTextFieldModel> _contas = <AutoCompleteTextFieldModel>[];

  @observable
  bool _busy = false;

  @observable
  bool _receita = true;

  @action
  void _setPortadores(List<AutoCompleteTextFieldModel> data) => _portadores = data;

  @action
  void _addConta(AutoCompleteTextFieldModel data) => _contas.add(data);

  @action
  void changeBusy() => _busy = !_busy;

  @action
  void changeReceita() => _receita = !_receita;

  @computed
  List<AutoCompleteTextFieldModel> get getPortadores => _portadores;

  @computed
  List<AutoCompleteTextFieldModel> get getContas => _contas;

  @computed
  bool get getBusy => _busy;

  @computed
  bool get getReceita => _receita;

  findPortadores() {
    _setPortadores(retornoPortadores);
  }

  findContas() {
    retornoContasPlano.forEach((element) => _addConta(AutoCompleteTextFieldModel(id: element.id, nome: element.nome)));
  }

  salvar() {
    if(formKey.currentState.validate()){
      //TODO: implementar código para salvar despesa/receita
    }
  }
}