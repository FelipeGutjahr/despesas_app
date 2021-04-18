import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/services/plano_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

part 'plano_controller.g.dart';

class PlanoController = _PlanoController with _$PlanoController;

abstract class _PlanoController with Store {
  final planoService = Modular.get<PlanoService>();

  BehaviorSubject<List<PlanoModel>> planos =
      BehaviorSubject<List<PlanoModel>>();

  Stream<List<PlanoModel>> get getPlanos {
    findPlanos();
    return planos.stream;
  }

  @observable
  bool _busy = false;

  @action
  void changeBusy() => _busy = !_busy;

  @computed
  bool get getBusy => _busy;

  findPlanos() async {
    List<PlanoModel> list = await planoService.findAll();
    planos.add(list);
  }
}
