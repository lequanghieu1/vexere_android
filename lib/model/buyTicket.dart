class BuyTicket {
  String maVeXe;
  String maCX;
  String soGhe;
  String email;
  String ngayDat;
  String maTX;
  String bienSoXe;
  String ngayDi;
  String gioDi;

  BuyTicket(
      {this.maVeXe,
      this.maCX,
      this.soGhe,
      this.email,
      this.ngayDat,
      this.maTX,
      this.bienSoXe,
      this.ngayDi,
      this.gioDi});

  BuyTicket.fromJson(Map<String, dynamic> json) {
    maVeXe = json['MaVeXe'];
    maCX = json['MaCX'];
    soGhe = json['SoGhe'];
    email = json['Email'];
    ngayDat = json['NgayDat'];
    maTX = json['MaTX'];
    bienSoXe = json['BienSoXe'];
    ngayDi = json['NgayDi'];
    gioDi = json['GioDi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MaVeXe'] = this.maVeXe;
    data['MaCX'] = this.maCX;
    data['SoGhe'] = this.soGhe;
    data['Email'] = this.email;
    data['NgayDat'] = this.ngayDat;
    data['MaTX'] = this.maTX;
    data['BienSoXe'] = this.bienSoXe;
    data['NgayDi'] = this.ngayDi;
    data['GioDi'] = this.gioDi;
    return data;
  }
}
