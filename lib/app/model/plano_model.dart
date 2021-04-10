class PlanoModel {
  int id;
  String codContabil;
  String nome;
  double saldoAtual;

  PlanoModel({
    this.id,
    this.codContabil,
    this.nome,
    this.saldoAtual
  });

  PlanoModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.codContabil = json['cod_contabil'];
    this.nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['cod_contabil'] = this.codContabil;
    data['nome'] = this.nome;
    return data;
  }
}