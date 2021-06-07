class Photo {
  String sId;
  String code;
  String url;
  int iV;
  String choose;

  Photo({this.sId, this.code, this.url, this.iV, this.choose});

  Photo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    code = json['code'];
    url = json['url'];
    iV = json['__v'];
    choose = json['choose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['code'] = this.code;
    data['url'] = this.url;
    data['__v'] = this.iV;
    data['choose'] = this.choose;
    return data;
  }
}