class TuyenXe {
  String maTX;
  String diemDi;
  String diemDen;
  int donGia;

  TuyenXe({this.maTX, this.diemDi, this.diemDen, this.donGia});

  TuyenXe.fromJson(Map<String, dynamic> json) {
    maTX = json['MaTX'];
    diemDi = json['DiemDi'];
    diemDen = json['DiemDen'];
    donGia = json['DonGia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MaTX'] = this.maTX;
    data['DiemDi'] = this.diemDi;
    data['DiemDen'] = this.diemDen;
    data['DonGia'] = this.donGia;
    return data;
  }
}
