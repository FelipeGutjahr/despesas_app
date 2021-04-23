import 'package:despesas_app/app/model/usuario_model.dart';
import 'package:despesas_app/app/utils/constants.dart';
import 'package:dio/dio.dart';

class UsuarioService {
  final Dio _dio;

  UsuarioService(this._dio);

  String _path = '/usuarios';

  Future<UsuarioModel> find() async {
    _dio.options.headers['authorization'] = TOKEN;
    var res = await _dio.get(_path);
    return UsuarioModel.fromJson(res.data);
  }
}
