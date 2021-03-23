import 'package:despesas_app/app/model/plano_model.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

part 'body_plano_controller.g.dart';

class BodyPlanoController = _BodyPlanoController with _$BodyPlanoController;

abstract class _BodyPlanoController with Store {

  _BodyPlanoController(){
    findAll();
  }
  
  BehaviorSubject<List<PlanoModel>> contas = BehaviorSubject<List<PlanoModel>>();

  List<PlanoModel> _contasRetornadas = [
    PlanoModel(codContabil: '1', nome: 'ATIVO', dre: false),
    PlanoModel(codContabil: '1.01', nome: 'ATIVO CIRCULANTE', dre: false),
    PlanoModel(codContabil: '1.01.01', nome: 'ATIVO CIRCULANTE LIQUIDO', dre: false),
    PlanoModel(codContabil: '1.01.01.01', nome: 'Clear Corretora', dre: false),
    PlanoModel(codContabil: '1.01.01.02', nome: 'Nubank', dre: false),
    PlanoModel(codContabil: '1.01.01.02', nome: 'Sicoob', dre: false)
  ];

  findAll() async {
    await Future.delayed(Duration(seconds: 3));
    contas.add(_contasRetornadas);
  }
}