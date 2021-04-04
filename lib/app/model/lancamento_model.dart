import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/model/portador_model.dart';

class LancamentoModel {
  int id;
  DateTime data;
  PortadorModel portador;
  double valor;
  String historico;
  PlanoModel plano;

  LancamentoModel({
    this.id,
    this.data,
    this.portador,
    this.valor,
    this.historico,
    this.plano
  });
}