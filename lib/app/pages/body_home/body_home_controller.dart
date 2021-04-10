import 'package:despesas_app/app/model/item_card_model.dart';
import 'package:despesas_app/app/model/portador_model.dart';
import 'package:despesas_app/app/services/home_service.dart';
import 'package:despesas_app/app/services/portador_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

part 'body_home_controller.g.dart';

 class BodyHomeController = _BodyHomeController with _$BodyHomeController;

 abstract class _BodyHomeController with Store {

  final portadorService = Modular.get<PortadorService>();
  final homeService = Modular.get<HomeService>();

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

  findAll() {
    resultadoMensal.add(750.16);
    gastoRecomendado.add(62.51);
    findTotalRecebido();
    findTotalPago();
    findSaldoPortadores();
  }

  findPortadores() async {
    List<PortadorModel> list = await portadorService.findAll();
    List<ItemCardModel> listItemCardModel = <ItemCardModel>[];
    double total = 0;
    list.forEach((element) {
      listItemCardModel.add(element.toItemCardModel());
      total = total + element.plano.saldoAtual;
    });
    //listItemCardModel.add(ItemCardModel(title: 'Total', value: 'R\$ ${total.toStringAsFixed(2).replaceAll(RegExp(r'\.'), ',')}'));
    portadores.add(listItemCardModel);
  }

  findTotalPago() async {
    List<ItemCardModel> list = await homeService.findTotalPago();
    totalPago.add(list);
  }

  findTotalRecebido() async {
    List<ItemCardModel> list = await homeService.findTotalRecebido();
    totalRecebido.add(list);
  }

  findSaldoPortadores() async {
    List<ItemCardModel> list = await homeService.findSaldoPortadores();
    portadores.add(list);
  }
}