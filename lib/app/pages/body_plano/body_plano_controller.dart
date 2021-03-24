import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/utils/constants.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

part 'body_plano_controller.g.dart';

class BodyPlanoController = _BodyPlanoController with _$BodyPlanoController;

abstract class _BodyPlanoController with Store {

  _BodyPlanoController(){
    findAll();
  }
  
  BehaviorSubject<List<PlanoModel>> contas = BehaviorSubject<List<PlanoModel>>();

  findAll() async {
    await Future.delayed(Duration(seconds: 3));
    contas.add(retornoContasPlano);
  }
}