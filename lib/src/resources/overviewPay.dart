import 'package:flutter/material.dart';
import 'package:flutter_app/src/blocs/auth_bloc.dart';
import 'package:flutter_app/src/resources/homepage.dart';


class EditInfo extends StatefulWidget {
  @required
  final String name;
  final String address;
  final String phone;
  const EditInfo(this.name, this.address, this.phone);
  @override
  _EditInfoState createState() => _EditInfoState(name,address,phone);
}

class _EditInfoState extends State<EditInfo> {
  AuthBloc authBloc = new AuthBloc();
  @required
  final String name;
  final String address;
  final String phone;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  _EditInfoState(this.name, this.address, this.phone);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 140,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: StreamBuilder(
                  stream: authBloc.nameStream,
                  builder: (context, snapshot) => TextField(
                    controller: _nameController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: '${name}',
                        helperText: 'Họ Tên',
                        errorText: snapshot.hasError ? snapshot.error : null,
                        prefixIcon: Container(
                            width: 50, child: Icon(Icons.person_rounded)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: StreamBuilder(
                  stream: authBloc.addressStream,
                  builder: (context, snapshot) => TextField(
                    controller: _addressController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: '${address}',
                        helperText: 'Địa Chỉ',
                        errorText: snapshot.hasError ? snapshot.error : null,
                        prefixIcon: Container(
                            width: 50, child: Icon(Icons.location_on)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: StreamBuilder(
                  stream: authBloc.phoneStream,
                  builder: (context, snapshot) => TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: '${phone}',
                        helperText: 'Số Điện Thoại',
                        errorText: snapshot.hasError ? snapshot.error : null,
                        prefixIcon: Container(
                            width: 50, child: Icon(Icons.local_phone)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    // ignore: deprecated_member_use
                    child: Row(
                      children: [
                        RaisedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "Quay Lại",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 110),
                          child: RaisedButton(
                            onPressed: _onLoginClick,
                            child: Text(
                              "Gửi",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onLoginClick() async {
    print(_nameController.text);
    _showMyDialog();

  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thông Báo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Thanh Toán Thành Công'),
                Text('3H express chúc bạn chuyến đi vui vẻ'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Về trang chủ'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        );
      },
    );
  }
}
