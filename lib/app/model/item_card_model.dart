class ItemCardModel {
  String title;
  String value;

  ItemCardModel({
    this.title,
    this.value
  });

  ItemCardModel.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['value'] = this.value;
    return data;
  }
}