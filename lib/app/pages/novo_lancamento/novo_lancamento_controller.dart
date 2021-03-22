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