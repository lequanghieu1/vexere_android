class BuyTicket {
  String sId;
  String to;
  String name;
  String from;
  String date;
  String position;
  String price;
  int iV;

  BuyTicket(
      {this.sId,
        this.to,
        this.name,
        this.from,
        this.date,
        this.position,
        this.price,
        this.iV});

  BuyTicket.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    to = json['to'];
    name = json['name'];
    from = json['from'];
    date = json['date'];
    position = json['position'];
    price = json['price'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['to'] = this.to;
    data['name'] = this.name;
    data['from'] = this.from;
    data['date'] = this.date;
    data['position'] = this.position;
    data['price'] = this.price;
    data['__v'] = this.iV;
    return data;
  }
}