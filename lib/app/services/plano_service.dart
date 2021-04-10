import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/utils/constants.dart';
import 'package:dio/dio.dart';

class PlanoService {

  final Dio _dio;

  PlanoService(this._dio);

  Future<List<PlanoModel>> findAll() async {
    _dio.options.headers['authorization'] = TOKEN;
    var res = await _dio.get('/planos');
    List<PlanoModel> list = <PlanoModel>[];
    res.data.forEach((value) => list.add(PlanoModel.fromJson(value)));
    return list;
  }
}