import 'package:despesas_app/app/model/item_card_model.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

part 'body_home_controller.g.dart';

 class BodyHomeController = _BodyHomeController with _$BodyHomeController;

 abstract class _BodyHomeController with Store {

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

  List<ItemCardModel> portadoresList = [
    ItemCardModel(title: 'PicPay', value: 'R\$ 100,15'),
    ItemCardModel(title: 'Nubank', value: 'R\$ 231,03'),
    ItemCardModel(title: 'Clear corretora', value: 'R\$ 150,72'),
    ItemCardModel(title: 'Carteira', value: 'R\$ 20,00'),
    ItemCardModel(title: 'Total', value: 'R\$ 501,09')
  ];

  findAll() async {
    await Future.delayed(Duration(seconds: 3));
    resultadoMensal.add(750.16);
    gastoRecomendado.add(62.51);
    totalPago.add(pago);
    totalRecebido.add(recebido);
    portadores.add(portadoresList);
  }
}