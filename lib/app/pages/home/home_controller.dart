import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {

  GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @observable
  int pageIndex = 0;

  @action
  void changePageIndex(int index) => this.pageIndex = index;

  @computed
  int get getPageIndex => pageIndex;
}