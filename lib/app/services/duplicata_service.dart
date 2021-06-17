import 'package:despesas_app/app/model/duplicata_model.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DuplicataService {
  final Dio _dio;

  DuplicataService(this._dio);

  String _path = '/duplicatas';

  Future<void> salvar(DuplicataModel duplicataModel) async {
    Response res = await _dio.post(_path, data: duplicataModel.toJson());
    print('Status code: ${res.statusCode}');
  }

  Future<List<DuplicataModel>> buscarComFiltros(DateTime dataInicial,
      DateTime dataFinal, bool receber, bool pagar) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _dio.options.headers['authorization'] = prefs.getString('token_access');

    try {
      String dataI = DateFormat("yyyy-MM-dd").format(dataInicial);
      String dataF = DateFormat("yyyy-MM-dd").format(dataFinal);
      String filtros = '/filtros?dataInicial=${dataI.toString()}' +
          '&dataFinal=${dataF.toString()}&pagar=${pagar.toString()}' +
          '&receber=${receber.toString()}';

      print(_path + filtros);

      Response res = await _dio.get(_path + filtros);
      List<DuplicataModel> list = <DuplicataModel>[];
      res.data.forEach((value) => list.add(DuplicataModel.fromJson(value)));
      return list;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
