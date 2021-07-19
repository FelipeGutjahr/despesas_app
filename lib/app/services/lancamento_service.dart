/*import 'package:despesas_app/app/model/lancamento_model.dart';
import 'package:dio/dio.dart';

class LancamentoService {
  final Dio _dio;

  LancamentoService(this._dio);

  String _path = '/lancamentos';

  Future<void> salvar(LancamentoModel lancamentoModel) async {
    Response res = await _dio.post(_path, data: lancamentoModel.toJson());
    print('Status code: ${res.statusCode}');
  }
}*/
