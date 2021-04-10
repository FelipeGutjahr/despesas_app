class ItemCardModel {
  String title;
  String value;

  ItemCardModel({
    this.title,
    this.value
  });

  ItemCardModel.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.value = 'R\$ ${json['value'].toStringAsFixed(2).replaceAll(RegExp(r'\.'), ',')}';
  }
}