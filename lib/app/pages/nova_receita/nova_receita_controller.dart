/*import 'package:despesas_app/app/model/duplicata_model.dart';
import 'package:despesas_app/app/model/lancamento_model.dart';
import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/model/portador_model.dart';
import 'package:despesas_app/app/services/duplicata_service.dart';
import 'package:despesas_app/app/services/lancamento_service.dart';
import 'package:despesas_app/app/services/plano_service.dart';
import 'package:despesas_app/app/services/portador_service.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'nova_receita_controller.g.dart';

class NovaReceitaController = _NovaReceitaController
    with _$NovaReceitaController;

abstract class _NovaReceitaController with Store {
  _NovaReceitaController() {
    findPortadores();
    findContas();
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

  LancamentoModel lancamentoModel = LancamentoModel();
  DuplicataModel duplicataModel = DuplicataModel(receber: true);

  @observable
  bool _busy = false;

  @observable
  bool _duplicata = false;

  @observable
  bool _duplicataSemRecebimentoPrevisto = false;

  @observable
  List<PortadorModel> _portadores = <PortadorModel>[];

  @observable
  List<PlanoModel> _contas = <PlanoModel>[];

  @action
  void changeBusy() => _busy = !_busy;

  @action
  void changeDuplicata() => {
        if (_duplicata && _duplicataSemRecebimentoPrevisto)
          {changeDuplicataSemRecebimentoPrevisto()},
        _duplicata = !_duplicata
      };

  @action
  void changeDuplicataSemRecebimentoPrevisto() =>
      _duplicataSemRecebimentoPrevisto = !_duplicataSemRecebimentoPrevisto;

  @action
  void _setPortadores(List<PortadorModel> data) => _portadores = data;

  @action
  void _setPlanos(List<PlanoModel> data) => _contas = data;

  @computed
  bool get getBusy => _busy;

  @computed
  bool get getDuplicata => _duplicata;

  @computed
  bool get getDuplicataSemRecebimentoPrevisto =>
      _duplicataSemRecebimentoPrevisto;

  @computed
  List<PortadorModel> get getPortadores => _portadores;

  @computed
  List<PlanoModel> get getPlanos => _contas;

  findPortadores() async {
    List<PortadorModel> data = await _portadorService.findAll();
    _setPortadores(data);
  }

  findContas() async {
    List<PlanoModel> list = await _planoService.findAll();
    _setPlanos(list);
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
}*/
