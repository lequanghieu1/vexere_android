class Info {
  String email;
  String tenKH;
  String sDT;
  String gioiTinh;
  String diaChi;

  Info({this.email, this.tenKH, this.sDT, this.gioiTinh, this.diaChi});

  Info.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    tenKH = json['TenKH'];
    sDT = json['SDT'];
    gioiTinh = json['GioiTinh'];
    diaChi = json['DiaChi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['TenKH'] = this.tenKH;
    data['SDT'] = this.sDT;
    data['GioiTinh'] = this.gioiTinh;
    data['DiaChi'] = this.diaChi;
    return data;
  }
}