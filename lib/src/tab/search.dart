import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/trip.dart';
import 'package:flutter_app/network/getAPI.dart';
import 'package:flutter_app/src/tab/myticket.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String MaTX;
  List<TuyenXe> trips = [];
  @override
  void initState() {
    _handleGetTrip();
    super.initState();
  }

  _handleGetTrip() async {
    datedata = date.toString().substring(0, 4) +
        '-' +
        date.toString().substring(5, 7) +
        '-' +
        date.toString().substring(8, 10);
    String hot = handlehot();
    var response = await http.get('$hot/trips');
    List noti = jsonDecode(response.body) as List;
    noti.forEach((element) {
      trips.add(TuyenXe.fromJson(element));
    });
    trips.forEach((element) {
      if (element.diemDi == from && element.diemDen == to) {
        MaTX = element.maTX;
      }
    });
  }

  DateTime date = DateTime.now();
  String datedata = '';
  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2022));
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  String from = 'TPHCM';
  List listItem = ['KienGiang', 'TienGiang', 'TPHCM'];
  String to = 'KienGiang';
  List details = [];
  List listGo = ['KienGiang', "TienGiang", 'TPHCM'];
  void _onLoginClick() async {
    print(MaTX);
    _handleGetTrip();
    String hot = handlehot();
    if (to == from) {
      return showAlertDialog(context, 'Điểm đi và điểm đến không được trùng!');
    }
    String datemonth = date.toString().substring(8, 10) +
        '-' +
        date.toString().substring(5, 7) +
        '-' +
        date.toString().substring(0, 4);
    var url = Uri.parse('$hot/trip?tripid=$MaTX&date=$datedata');
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200 && response.body != []) {
      setState(() {
        details = jsonDecode(response.body.toString()) as List;
        if (details.length == 0) {
          showAlertDialog(context, "Không tồn tại chuyến đi");
        }
      });
    } else {
      showAlertDialog(context, "Không tồn tại chuyến đi");
    }
  }

  showAlertDialog(BuildContext context, text) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Có lỗi"),
      content: Text(text),
      actions: [
        FlatButton(
          child: Text("Đóng lại"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Các chuyến phù hợp')),
      body: details.toList().length == 0
          ? Center(
              child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 0,
                  ),
                  Image.asset('xekhach.png'),
                  Text(
                    "Chào mừng!",
                    style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                  ),
                  Text(
                    "Hãy chọn địa điểm để đặt vé",
                    style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(9)),
                      child: DropdownButton(
                          hint: Text('Nơi xuất phát'),
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(fontSize: 22, color: Colors.black),
                          value: from,
                          onChanged: (newValue) {
                            setState(() {
                              from = newValue;
                              _handleGetTrip();
                            });
                          },
                          items: listItem.map((newValue) {
                            return DropdownMenuItem(
                              value: newValue,
                              child: Text(newValue),
                            );
                          }).toList()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(9)),
                      child: DropdownButton(
                          hint: Text('Bạn muốn đi đâu'),
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(fontSize: 22, color: Colors.black),
                          value: to,
                          onChanged: (newValue) {
                            setState(() {
                              to = newValue;
                              _handleGetTrip();
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
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: SizedBox(
                          width: double.infinity,
                          height: 52,
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            onPressed: () {
                              selectTimePicker(context);
                            },
                            child: Text(

                              date.toString().substring(8, 10) +
                                  '-' +
                                  date.toString().substring(5, 7) +
                                  '-' +
                                  date.toString().substring(0, 4),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            color: Colors.white38,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                          ),
                        ),
                      ),
                      // Text()
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: SizedBox(
                      width: 100,
                      height: 52,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: _onLoginClick,
                        child: Text(
                          "Tìm Vé",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        color: Color(0xff3277D8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          : GroupedListView<dynamic, String>(
              elements: details.toList(),
              groupBy: (element) => element['NgayDi'],
              groupSeparatorBuilder: (String groupByValue) => Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Flexible(
                        child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              groupByValue,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ))
                  ],
                ),
              ),
              itemBuilder: (context, dynamic element) {
                return Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: ClipRRect(
                          child: Image.asset('phuongtrang.jpg'),
                          borderRadius: BorderRadius.circular(5),
                        )),
                        Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      element['BienSoXe'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(Icons.account_circle_sharp,
                                            color: Colors.grey, size: 16),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text('${element['GioDi']}'),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(Icons.money,
                                            color: Colors.grey, size: 16),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text('${element['NgayDi']}'),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Ticket(to, from,
                                          datedata.toString(), element['GioDi'],MaTX))),
                            },
                            child: Image.asset("giohang.png"),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemComparator: (item1, item2) =>
                  item1['NgayDi'].compareTo(item2['GioDi']), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            ),
    );
  }
}
