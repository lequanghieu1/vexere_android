class Photo {
  String sId;
  String name;
  String url;
  int iV;

  Photo({this.sId, this.name, this.url, this.iV});

  Photo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    url = json['url'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['url'] = this.url;
    data['__v'] = this.iV;
    return data;
  }
}