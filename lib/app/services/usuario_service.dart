import 'package:despesas_app/app/model/usuario_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioService {
  final Dio _dio;

  UsuarioService(this._dio);

  String _path = '/usuarios';

  Future<UsuarioModel> find() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _dio.options.headers['authorization'] = prefs.getString('token_access');
    var res = await _dio.get(_path);
    return UsuarioModel.fromJson(res.data);
  }
}
