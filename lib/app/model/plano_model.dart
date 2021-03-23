class PlanoModel {
  String codContabil;
  String nome;
  bool dre;

  PlanoModel({
    this.codContabil,
    this.nome,
    this.dre
  });

  PlanoModel.fromJson(Map<String, dynamic> json) {
    this.codContabil = json['cod_contabil'];
    this.nome = json['nome'];
    this.dre = json['dre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cod_contabil'] = this.codContabil;
    data['nome'] = this.nome;
    data['dre'] = this.dre;
    return data;
  }
}