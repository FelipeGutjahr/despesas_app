import 'package:despesas_app/app/model/portador_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PortadorService {
  final Dio _dio;

  PortadorService(this._dio);

  String _path = '/portadores';

  Future<List<PortadorModel>> findAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _dio.options.headers['authorization'] = prefs.getString('token_access');
    var res = await _dio.get(_path);
    List<PortadorModel> list = <PortadorModel>[];
    res.data.forEach((value) => list.add(PortadorModel.fromJson(value)));
    return list;
  }

  Future<void> salvar(PortadorModel portadorModel) async {
    Response res = await _dio.post(_path, data: portadorModel.toJson());
    print('Status code: ${res.statusCode}');
  }
}
