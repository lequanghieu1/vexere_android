import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/network/getAPI.dart';
import 'package:flutter_app/src/blocs/auth_bloc.dart';
import 'package:flutter_app/src/resources/homepage.dart';
import 'package:http/http.dart' as http;


class EditInfo extends StatefulWidget {
  @required
  final String name;
  final String address;
  final String phone;
  final List chair;
  const EditInfo(this.name, this.address, this.phone,this.chair);
  @override
  _EditInfoState createState() => _EditInfoState(name,address,phone,chair);
}

class _EditInfoState extends State<EditInfo> {
  AuthBloc authBloc = new AuthBloc();
  @required
  final String name;
  final String address;
  final String phone;
  final List chair;
   TextEditingController _nameController = TextEditingController();
   TextEditingController _phoneController = TextEditingController();
   TextEditingController _addressController = TextEditingController();

  _EditInfoState(this.name, this.address, this.phone,this.chair);
  void initState() {
    print(chair);
   _nameController.text = name;
   _phoneController.text = phone;
   _addressController.text = address;
  }
  String to = 'Nam';
  List listGo = ['Nam', 'Nữ'];
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
                        helperText: 'Họ Tên',
                        enabled: name == ''?false:true,
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
                    padding: const EdgeInsets.all(.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(9)),
                      child: DropdownButton(
                          hint: Text('Giới Tính'),
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(fontSize: 22, color: Colors.black),
                          value: to,
                          onChanged: (newValue) {
                            setState(() {
                              to = newValue;
                            });
                          },
                          items: listGo.map((newValue) {
                            return DropdownMenuItem(
                              value: newValue,
                              child: Text(newValue),
                            );
                          }).toList()),
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
    String hot = handlehot();
          var url = Uri.parse('$hot/user/m/pay');
      var response = await http.post(url, body: {
        'Email': "shinminah357159@gmail.com",
        'NgayDat': "djsbf",
        "MaCX":"P001",
        "SLGhe":jsonEncode(chair),
        "SDT":"dsf",
        "DiaChi":"ffbfg"
      });
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
