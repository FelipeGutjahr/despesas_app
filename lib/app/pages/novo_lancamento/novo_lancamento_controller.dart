import 'package:despesas_app/app/model/auto_complete_text_field_model.dart';
import 'package:despesas_app/app/model/lancamento_model.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'novo_lancamento_controller.g.dart';

class NovoLancamentoController = _NovoLancamentoController with _$NovoLancamentoController;

abstract class _NovoLancamentoController with Store {
  
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

  List<AutoCompleteTextFieldModel> portadores = [
    AutoCompleteTextFieldModel(id: 1, nome: 'Nubank'),
    AutoCompleteTextFieldModel(id: 2, nome: 'Clear Corretora'),
    AutoCompleteTextFieldModel(id: 3, nome: 'Carteira'),
    AutoCompleteTextFieldModel(id: 4, nome: 'PicPay'),
  ];

  @observable
  bool _busy = false;

  @observable
  bool _receita = true;

  @action
  void changeBusy() => _busy = !_busy;

  @action
  void changeReceita() => _receita = !_receita;

  @computed
  bool get getBusy => _busy;

  @computed
  bool get getReceita => _receita;
}