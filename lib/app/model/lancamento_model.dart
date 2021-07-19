/*import 'package:despesas_app/app/model/plano_model.dart';
import 'package:intl/intl.dart';

class LancamentoModel {
  int? id;
  late DateTime data;
  double? valor;
  String? historico;
  PlanoModel? planoDebito;
  PlanoModel? planoCredito;
  bool? isCredito;
  bool? isParcelado;
  int? qtdParcelas;

  LancamentoModel(
      {this.id,
      required this.data,
      required this.valor,
      required this.historico,
      required this.planoDebito,
      required this.planoCredito,
      required this.isCredito,
      required this.isParcelado,
      this.qtdParcelas});

  LancamentoModel.fromJson(Map<String, dynamic> json) {
    data = json['id'];
    data = json['data'];
    valor = json['valor'];
    historico = json['historico'];
    planoDebito = PlanoModel.fromJson(json['plano_debito']);
    planoCredito = PlanoModel.fromJson(json['plano_credito']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = DateFormat("yyyy-MM-dd").format(this.data);
    data['valor'] = this.valor;
    data['historico'] = this.historico;
    data['plano_debito_id'] = this.planoDebito?.id;
    data['plano_credito_id'] = this.planoCredito?.id;
    data['is_credito'] = this.isCredito == null ? false : this.isCredito;
    data['is_parcelado'] = this.isParcelado == null ? false : this.isParcelado;
    data['qtd_parcelas'] = this.qtdParcelas == null ? 0 : this.qtdParcelas;
    return data;
  }

  @override
  String toString() {
    print(this.data.toString());
    return super.toString();
  }
}*/
