import 'package:despesas_app/app/model/portador_model.dart';
import 'package:despesas_app/app/utils/constants.dart';
import 'package:dio/dio.dart';

class PortadorService {

  final Dio _dio;

  PortadorService(this._dio);

  Future<List<PortadorModel>> findAll() async {
    _dio.options.headers['authorization'] = TOKEN;
    var res = await _dio.get('/portadores');
    List<PortadorModel> list = <PortadorModel>[];
    res.data.forEach((value) => list.add(PortadorModel.fromJson(value)));
    return list;
  }
}