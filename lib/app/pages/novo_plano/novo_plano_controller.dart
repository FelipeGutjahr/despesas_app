import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/services/plano_service.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'novo_plano_controller.g.dart';

class NovoPlanoController = _NovoPlanoController with _$NovoPlanoController;

abstract class _NovoPlanoController with Store {
  final _planoService = Modular.get<PlanoService>();

  var maskCodContabil = TextInputMask(mask: '9.99.99.99.99.99.99.99.99.99.99');

  final formKey = GlobalKey<FormState>();

  PlanoModel planoModel = PlanoModel(dre: false);

  @observable
  bool _isDre = false;

  @action
  void changeIsDre() {
    _isDre = !_isDre;
    planoModel.dre = _isDre;
  }

  @computed
  bool get getIsDre => _isDre;

  salvar() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await _planoService.salvar(planoModel);
      Modular.to.pop();
    }
  }
}
