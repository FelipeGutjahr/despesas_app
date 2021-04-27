import 'package:despesas_app/app/model/item_card_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeService {
  final Dio _dio;

  HomeService(this._dio);

  Future<List<ItemCardModel>> findTotalPago() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _dio.options.headers['authorization'] = prefs.getString('token_access');
    var res = await _dio.get('/home/pago');
    List<ItemCardModel> list = <ItemCardModel>[];
    res.data.forEach((value) => list.add(ItemCardModel.fromJson(value)));
    return list;
  }

  Future<List<ItemCardModel>> findTotalRecebido() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _dio.options.headers['authorization'] = prefs.getString('token_access');
    var res = await _dio.get('/home/recebido');
    List<ItemCardModel> list = <ItemCardModel>[];
    res.data.forEach((value) => list.add(ItemCardModel.fromJson(value)));
    return list;
  }

  Future<List<ItemCardModel>> findSaldoPortadores() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _dio.options.headers['authorization'] = prefs.getString('token_access');
    var res = await _dio.get('/home/portadores');
    List<ItemCardModel> list = <ItemCardModel>[];
    res.data.forEach((value) => list.add(ItemCardModel.fromJson(value)));
    return list;
  }
}
