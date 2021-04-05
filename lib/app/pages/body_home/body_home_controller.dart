import 'package:despesas_app/app/model/item_card_model.dart';
import 'package:despesas_app/app/model/portador_model.dart';
import 'package:despesas_app/app/services/portador_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

part 'body_home_controller.g.dart';

 class BodyHomeController = _BodyHomeController with _$BodyHomeController;

 abstract class _BodyHomeController with Store {

   final service = Modular.get<PortadorService>();

  _BodyHomeController(){
    findAll();
  }

  BehaviorSubject<double> resultadoMensal = BehaviorSubject<double>();
  BehaviorSubject<double> gastoRecomendado = BehaviorSubject<double>();
  BehaviorSubject<List<ItemCardModel>> totalPago = BehaviorSubject<List<ItemCardModel>>();
  BehaviorSubject<List<ItemCardModel>> totalRecebido = BehaviorSubject<List<ItemCardModel>>();
  BehaviorSubject<List<ItemCardModel>> portadores = BehaviorSubject<List<ItemCardModel>>();

  Stream<double> get getResultadoMensal => resultadoMensal.stream;
  Stream<double> get getGastoRecomendado => gastoRecomendado.stream;
  Stream<List<ItemCardModel>> get getTotalPago => totalPago.stream;
  Stream<List<ItemCardModel>> get getTotalRecebido => totalRecebido.stream;
  Stream<List<ItemCardModel>> get getPortadores => portadores.stream;

  List<ItemCardModel> pago = [
    ItemCardModel(title: 'Hoje', value: 'R\$ 15,00'),
    ItemCardModel(title: 'Este mês', value: 'R\$ 1.032,03')
  ];

  List<ItemCardModel> recebido = [
    ItemCardModel(title: 'Hoje', value: 'R\$ 0,00'),
    ItemCardModel(title: 'Este mês', value: 'R\$ 1782,19')
  ];

  findAll() {
    resultadoMensal.add(750.16);
    gastoRecomendado.add(62.51);
    totalPago.add(pago);
    totalRecebido.add(recebido);
    findPortadores();
  }

  findPortadores() async {
    List<PortadorModel> list = await service.findAll();
    List<ItemCardModel> listItemCardModel = <ItemCardModel>[];
    list.forEach((element) => listItemCardModel.add(element.toItemCardModel()));
    portadores.add(listItemCardModel);
  }
}