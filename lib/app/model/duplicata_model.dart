import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/model/portador_model.dart';
import 'package:intl/intl.dart';

class DuplicataModel {
  int id;
  DateTime dataInclusao;
  DateTime dataVencimento;
  double valor;
  double saldo;
  String observacao;
  bool aReceber;
  PortadorModel portador;
  PlanoModel plano;

  DuplicataModel(
      {this.id,
      this.dataInclusao,
      this.dataVencimento,
      this.valor,
      this.saldo,
      this.observacao,
      this.aReceber,
      this.portador,
      this.plano});

  DuplicataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dataInclusao = json['dataInclusao'];
    dataVencimento = json['dataVencimento'];
    valor = json['valor'];
    saldo = json['saldo'];
    observacao = json['observacao'];
    aReceber = json['aReceber'];
    portador = json['portador'] != null
        ? new PortadorModel.fromJson(json['portador'])
        : null;
    plano =
        json['plano'] != null ? new PlanoModel.fromJson(json['plano']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dataInclusao'] = DateFormat("yyyy-MM-dd").format(this.dataInclusao);
    data['dataVencimento'] = this.dataVencimento == null
        ? null
        : DateFormat("yyyy-MM-dd").format(this.dataVencimento);
    data['valor'] = this.valor;
    data['saldo'] = this.saldo;
    data['observacao'] = this.observacao;
    data['aReceber'] = this.aReceber;
    data['portador_id'] = this.portador.id;
    data['plano_id'] = this.plano.id;
    return data;
  }
}
