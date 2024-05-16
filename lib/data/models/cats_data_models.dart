class CatsDataModel {
  String? id;
  String? url;
  double ? width;
  double ? height;

  CatsDataModel({this.id, this.url, this.width, this.height});

  CatsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    width = json['width'].toDouble();
    height = json['height'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}
