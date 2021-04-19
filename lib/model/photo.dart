class Photo {
  String sId;
  String name;
  String url;
  int iV;
  String choose;

  Photo({this.sId, this.name, this.url, this.iV, this.choose});

  Photo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    url = json['url'];
    iV = json['__v'];
    choose = json['choose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['url'] = this.url;
    data['__v'] = this.iV;
    data['choose'] = this.choose;
    return data;
  }
}