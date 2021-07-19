/*import 'package:despesas_app/app/model/plano_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlanoService {
  final Dio _dio;

  PlanoService(this._dio);

  String _path = '/planos';

  Future<List<PlanoModel>> findAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _dio.options.headers['authorization'] = prefs.getString('token_access');
    var res = await _dio.get(_path);
    List<PlanoModel> list = <PlanoModel>[];
    res.data.forEach((value) => list.add(PlanoModel.fromJson(value)));
    return list;
  }

  Future<void> salvar(PlanoModel planoModel) async {
    Response res = await _dio.post(_path, data: planoModel.toJson());
    print('Status code: ${res.statusCode}');
  }
}*/
