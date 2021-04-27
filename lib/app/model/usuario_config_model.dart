class UsuarioConfigModel {
  int primeiroDiaMes;
  bool darkTheme;

  UsuarioConfigModel({this.primeiroDiaMes, this.darkTheme});

  UsuarioConfigModel.fromJson(Map<String, dynamic> json) {
    primeiroDiaMes = json['primeiroDiaMes'];
    darkTheme = json['darkTheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primeiroDiaMes'] = this.primeiroDiaMes;
    data['darkTheme'] = this.darkTheme;
    return data;
  }
}
