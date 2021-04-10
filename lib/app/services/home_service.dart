import 'package:despesas_app/app/model/item_card_model.dart';
import 'package:despesas_app/app/utils/constants.dart';
import 'package:dio/dio.dart';

class HomeService {

  final Dio _dio;

  HomeService(this._dio);

  Future<List<ItemCardModel>> findTotalPago() async {
    _dio.options.headers['authorization'] = TOKEN;
    var res = await _dio.get('/home/pago');
    List<ItemCardModel> list = <ItemCardModel>[];
    res.data.forEach((value) => list.add(ItemCardModel.fromJson(value)));
    return list;
  }

  Future<List<ItemCardModel>> findTotalRecebido() async {
    _dio.options.headers['authorization'] = TOKEN;
    var res = await _dio.get('/home/recebido');
    List<ItemCardModel> list = <ItemCardModel>[];
    res.data.forEach((value) => list.add(ItemCardModel.fromJson(value)));
    return list;
  }

  Future<List<ItemCardModel>> findSaldoPortadores() async {
    _dio.options.headers['authorization'] = TOKEN;
    var res = await _dio.get('/home/portadores');
    List<ItemCardModel> list = <ItemCardModel>[];
    res.data.forEach((value) => list.add(ItemCardModel.fromJson(value)));
    return list;
  }
}