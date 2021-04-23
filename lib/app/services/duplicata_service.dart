import 'package:despesas_app/app/model/duplicata_model.dart';
import 'package:dio/dio.dart';

class DuplicataService {
  final Dio _dio;

  DuplicataService(this._dio);

  String _path = '/duplicatas';

  Future<void> salvar(DuplicataModel duplicataModel) async {
    Response res = await _dio.post(_path, data: duplicataModel.toJson());
    print('Status code: ${res.statusCode}');
  }
}
