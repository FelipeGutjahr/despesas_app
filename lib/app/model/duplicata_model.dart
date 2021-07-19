/*import 'package:despesas_app/app/model/plano_model.dart';
import 'package:despesas_app/app/model/portador_model.dart';

class DuplicataModel {
  int? id;
  DateTime? dataInclusao;
  DateTime? dataVencimento;
  double? valor;
  double? saldo;
  String? observacao;
  bool? receber;
  PortadorModel? portador;
  PlanoModel? plano;

  DuplicataModel(
      {this.id,
      this.dataInclusao,
      this.dataVencimento,
      this.valor,
      this.saldo,
      this.observacao,
      this.receber,
      this.portador,
      this.plano});

  DuplicataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dataInclusao = formatDate(json['dataInclusao']);
    dataVencimento = formatDate(json['dataVencimento']);
    valor = json['valor'];
    saldo = json['saldo'];
    observacao = json['observacao'];
    receber = json['receber'];
    portador = json['portador'] != null
        ? new PortadorModel.fromJson(json['portador'])
        : null;
    plano =
        json['plano'] != null ? new PlanoModel.fromJson(json['plano']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dataInclusao'] = this.dataInclusao;
    data['dataVencimento'] = this.dataVencimento;
    data['valor'] = this.valor;
    data['saldo'] = this.saldo;
    data['observacao'] = this.observacao;
    data['receber'] = this.receber;
    data['portador_id'] = this.portador?.id;
    data['plano_id'] = this.plano?.id;
    return data;
  }

  DateTime formatDate(String data) {
    var formattedDate = data.split('-');
    DateTime dataNew = new DateTime.utc(int.parse(formattedDate[0]),
        int.parse(formattedDate[1]), int.parse(formattedDate[2]));
    return dataNew;
  }
}*/
