import 'package:despesas_app/app/model/portador_model.dart';

class LancamentoModel {
  int id;
  DateTime data;
  PortadorModel portador;
  double valor;
  String historico;

  LancamentoModel({
    this.id,
    this.data,
    this.portador,
    this.valor,
    this.historico
  });
}