import 'package:despesas_app/app/model/item_card_model.dart';
import 'package:despesas_app/app/services/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  //final portadorService = Modular.get<PortadorService>();
  final homeService = Modular.get<HomeService>();

  _HomeController() {
    findAll();
  }

  BehaviorSubject<double> resultadoMensal = BehaviorSubject<double>();
  BehaviorSubject<double> gastoRecomendado = BehaviorSubject<double>();
  BehaviorSubject<List<ItemCardModel>> totalPago =
      BehaviorSubject<List<ItemCardModel>>();
  BehaviorSubject<List<ItemCardModel>> totalRecebido =
      BehaviorSubject<List<ItemCardModel>>();
  BehaviorSubject<List<ItemCardModel>> portadores =
      BehaviorSubject<List<ItemCardModel>>();

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

  Size _size;

  double _drawerWidth = 239;

  double _bodyWidth = 1140;

  setSize(Size size) => this._size = size;

  double get getFullWidth => _size.width;

  double get getFullHeight => _size.height;

  double get getDrawerWidth => _drawerWidth;

  double get getBodyWidth {
    if (getShowDrawer) {
      // se o tamanho total - tamanho do drawer for menor que o tamanho do body
      if ((getFullWidth - getDrawerWidth) < _bodyWidth)
        return getFullWidth - getDrawerWidth;
      else
        return _bodyWidth;
    } else {
      if (getFullWidth < _bodyWidth)
        return getFullWidth;
      else
        return _bodyWidth;
    }
  }

  double get getWidthBackBodyContainer =>
      getShowDrawer ? getFullWidth - getDrawerWidth : getFullWidth;

  double get getWidthCard => getBodyWidth * 0.245;

  @observable
  bool _showDrawer = true;

  @observable
  bool _busy = false;

  @observable
  bool _selectItem1 = false;

  @observable
  bool _selectItem2 = false;

  @observable
  bool _expandedPanel1 = false;

  @action
  void changeShowDrawer() => _showDrawer = !_showDrawer;

  @action
  void changeBusy() => _busy = !_busy;

  @action
  void changeSelectItem1() => _selectItem1 = !_selectItem1;

  @action
  void changeSelectItem2() => _selectItem2 = !_selectItem2;

  @action
  void changeExpandedPanel1() => _expandedPanel1 = !_expandedPanel1;

  @computed
  bool get getShowDrawer => _showDrawer;

  @computed
  bool get getBusy => _busy;

  @computed
  bool get getSelectItem1 => _selectItem1;

  @computed
  bool get getSelectItem2 => _selectItem2;

  @computed
  bool get getExpandedPanel1 => _expandedPanel1;
}
