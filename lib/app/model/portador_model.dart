/*import 'package:despesas_app/app/model/plano_model.dart';

class PortadorModel {
  int? id;
  String? nome;
  PlanoModel? plano;
  bool? credito;
  double? limite;

  PortadorModel(
      {this.id,
      required this.nome,
      required this.plano,
      required this.credito,
      this.limite});

  PortadorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    credito = json['credito'];
    limite = json['limite'];
    plano = PlanoModel.fromJson(json['plano']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['credito'] = this.credito;
    data['limite'] = this.limite;
    data['plano_id'] = this.plano?.id;
    return data;
  }
}*/
