import 'package:despesas_app/app/model/item_card_model.dart';
import 'package:despesas_app/app/model/plano_model.dart';

class PortadorModel {
  int id;
  String nome;
  PlanoModel plano;
  bool credito;
  double limite;

  PortadorModel({this.id, this.nome, this.plano, this.credito, this.limite});

  PortadorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    plano = json['plano'] != null ? new PlanoModel.fromJson(json['plano']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    if (this.plano != null) {
      data['plano'] = this.plano.toJson();
    }
    return data;
  }

  ItemCardModel toItemCardModel() {
    final ItemCardModel itemCardModel = ItemCardModel();
    itemCardModel.title = this.nome;
    itemCardModel.value = 'R\$ ${this.plano.saldoAtual.toString()}';
    return itemCardModel;
  }
}