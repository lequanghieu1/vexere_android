class Search {
  String sId;
  String to;
  String from;
  String date;
  int iV;
  String price;

  Search({this.sId, this.to, this.from, this.date, this.iV, this.price});

  Search.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    to = json['to'];
    from = json['from'];
    date = json['date'];
    iV = json['__v'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['to'] = this.to;
    data['from'] = this.from;
    data['date'] = this.date;
    data['__v'] = this.iV;
    data['price'] = this.price;
    return data;
  }
}