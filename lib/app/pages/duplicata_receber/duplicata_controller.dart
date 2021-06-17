import 'package:despesas_app/app/model/duplicata_model.dart';
import 'package:despesas_app/app/services/duplicata_service.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

part 'duplicata_controller.g.dart';

class DuplicataController = _DuplicataController with _$DuplicataController;

abstract class _DuplicataController with Store {
  final _duplicataService = Modular.get<DuplicataService>();

  var maskFormatterData = TextInputMask(mask: '99/99/9999');

  TextEditingController controllerDataInicial = TextEditingController();

  DateTime dataInicial = DateTime.now();
  DateTime dataFinal = DateTime.now();

  BehaviorSubject<List<DuplicataModel>> _duplicatas =
      BehaviorSubject<List<DuplicataModel>>();

  Stream<List<DuplicataModel>> get getDuplicatas {
    return _duplicatas.stream;
  }

  DateTime dataAtual = DateTime.now();

  @observable
  bool _busy = false;

  @observable
  bool _receber = true;

  @observable
  bool _pagar = true;

  @action
  void changeBusy() => _busy = !_busy;

  @action
  void changeReceber() => _receber = !_receber;

  @action
  void changePagar() => _pagar = !_pagar;

  @computed
  bool get getBusy => _busy;

  @computed
  bool get getReceber => _receber;

  @computed
  bool get getPagar => _pagar;

  buscarComFiltros() async {
    changeBusy();
    List<DuplicataModel> list = await _duplicataService.buscarComFiltros(
        dataInicial, dataFinal, _receber, _pagar);
    _duplicatas.add(list);
    changeBusy();
  }
}
