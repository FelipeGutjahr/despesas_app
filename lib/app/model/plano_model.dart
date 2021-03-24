class PlanoModel {
  int id;
  String codContabil;
  String nome;
  bool dre;
  bool aceitalanc;

  PlanoModel({
    this.id,
    this.codContabil,
    this.nome,
    this.dre,
    this.aceitalanc,
  });

  PlanoModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.codContabil = json['cod_contabil'];
    this.nome = json['nome'];
    this.dre = json['dre'];
    this.aceitalanc = json['aceita_lanc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['cod_contabil'] = this.codContabil;
    data['nome'] = this.nome;
    data['dre'] = this.dre;
    data['aceita_lanc'] = this.aceitalanc;
    return data;
  }
}