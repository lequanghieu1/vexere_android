import 'package:flutter/material.dart';
import 'package:flutter_app/model/buyTicket.dart';
import 'package:flutter_app/network/myticket.dart';

class MyTicket extends StatefulWidget {
  @override
  _MyTicketState createState() => _MyTicketState();
}

class _MyTicketState extends State<MyTicket> {
  // ignore: deprecated_member_use
  List<BuyTicket> _ticket = List<BuyTicket>();
  // ignore: deprecated_member_use
  List<BuyTicket> _ticketDisplay = List<BuyTicket>();
  DateTime date = DateTime.now();
  setText() {
    if (choose4 == true) {
      return 'Rất Tốt';
    } else if (choose3 == true) {
      return 'Tốt';
    } else if (choose2 == true) {
      return 'Bình Thường';
    } else if (choose1 == true) {
      return 'Tệ';
    } else if (choose0 == true) {
      return 'Rất Tệ';
    }
    return 'Mời bạn chọn số sao để đánh giá';
  }

  var choose0 = false;
  var choose1 = false;
  var choose2 = false;
  var choose3 = false;
  var choose4 = false;
  var doing = false;

  @override
  void initState() {
    fetchTicKet().then((value) => {
          setState(() {
            _ticket.addAll(value);
            _ticketDisplay = _ticket;
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vé Của Bạn')),
      body: ListView.builder(
          itemCount: _ticketDisplay.length + 1,
          itemBuilder: (BuildContext context, int index) {
            return index == 0 ? _searchBar() : _listItem(index - 1);
          }),
    );
  }

  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(hintText: 'Tìm Id vé ...'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _ticketDisplay = _ticket.where((ticket) {
              var idTic = ticket.maVeXe.toLowerCase();
              return idTic.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _ticketDisplay[index].maVeXe,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Điểm đi : " + _ticketDisplay[index].soGhe,
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "Điểm đến : " + _ticketDisplay[index].email,
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "Ngày đi : " + _ticketDisplay[index].ngayDat,
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "Giá Vé : " + _ticketDisplay[index].ngayDi,
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "Số Ghế : " + _ticketDisplay[index].gioDi,
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "Chủ Vé : " + _ticketDisplay[index].bienSoXe,
              style: TextStyle(color: Colors.grey),
            ),
            RaisedButton(
              onPressed: () => {
                if (int.parse(date.toString().substring(8, 10)) -
                        int.parse(_ticketDisplay[index].ngayDi.substring(8, 10)) >
                    0)
                  {
                    if (doing == false)
                      {
                        _showMyDialog('Đánh Giá Chuyến Đi'),
                      }
                  }
                else if (int.parse(_ticketDisplay[index].ngayDi.substring(8, 10)) -
                        int.parse(date.toString().substring(8, 10)) >
                    0)
                  {
                    _showMyDialog('Hủy Vé'),
                  }
              },
              child: int.parse(_ticketDisplay[index].ngayDi.substring(8, 10)) -
                          int.parse(date.toString().substring(8, 10)) >
                      0
                  ? Text(
                      "Hủy Vé",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  : int.parse(date.toString().substring(8, 10)) -
                              int.parse(
                                  _ticketDisplay[index].ngayDi.substring(8, 10)) >
                          0
                      ? doing == false
                          ? Text(
                              "Đánh Giá Chuyến Đi",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          : Text(
                              "Đã Gửi Đánh Giá",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                      : Text(
                          "Chuyến đang đi",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
              color: int.parse(_ticketDisplay[index].ngayDi.substring(8, 10)) -
                        int.parse(date.toString().substring(8, 10)) >
                    0
                  ? Colors.red
                  : int.parse(date.toString().substring(8, 10)) -
                              int.parse(
                                  _ticketDisplay[index].ngayDi.substring(8, 10)) >
                          0
                      ? doing == false
                          ? Colors.blue
                          : Colors.grey
                      : Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6))),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(String number) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(number),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                number == 'Đánh Giá Chuyến Đi'
                    ? new Wrap(
                        spacing: -10, // gap between adjacent chips
                        runSpacing: 4.0, // gap between lines
                        direction: Axis.horizontal,
                        children: [
                          MaterialButton(
                            minWidth: 0,
                            onPressed: () {
                              setState(() {
                                choose0 = true;
                                choose1 = false;
                                choose2 = false;
                                choose3 = false;
                                choose4 = false;
                              });
                              Navigator.of(context).pop();
                              _showMyDialog(number);
                            },
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.star,
                              color: choose0 == true
                                  ? Colors.deepOrangeAccent
                                  : Colors.grey,
                            ),
                          ),
                          MaterialButton(
                            minWidth: 10,
                            onPressed: () {
                              setState(() {
                                choose0 = true;
                                choose1 = true;
                                choose2 = false;
                                choose3 = false;
                                choose4 = false;
                              });
                              Navigator.of(context).pop();
                              _showMyDialog(number);
                            },
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(Icons.star,
                                color: choose1 == true
                                    ? Colors.deepOrangeAccent
                                    : Colors.grey),
                          ),
                          MaterialButton(
                            minWidth: 10,
                            padding: EdgeInsets.only(right: 20),
                            onPressed: () {
                              setState(() {
                                choose0 = true;
                                choose1 = true;
                                choose2 = true;
                                choose3 = false;
                                choose4 = false;
                              });
                              Navigator.of(context).pop();
                              _showMyDialog(number);
                            },
                            child: Icon(Icons.star,
                                color: choose2 == true
                                    ? Colors.deepOrangeAccent
                                    : Colors.grey),
                          ),
                          MaterialButton(
                            minWidth: 10,
                            onPressed: () {
                              setState(() {
                                choose0 = true;
                                choose1 = true;
                                choose2 = true;
                                choose3 = true;
                                choose4 = false;
                              });
                              Navigator.of(context).pop();
                              _showMyDialog(number);
                            },
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(Icons.star,
                                color: choose3 == true
                                    ? Colors.deepOrangeAccent
                                    : Colors.grey),
                          ),
                          MaterialButton(
                            minWidth: 10,
                            padding: EdgeInsets.only(right: 20),
                            onPressed: () {
                              setState(() {
                                choose0 = true;
                                choose1 = true;
                                choose2 = true;
                                choose3 = true;
                                choose4 = true;
                              });
                              Navigator.of(context).pop();
                              _showMyDialog(number);
                            },
                            child: Icon(Icons.star,
                                color: choose4 == true
                                    ? Colors.deepOrangeAccent
                                    : Colors.grey),
                          )
                        ],
                      )
                    : Text('Bạn Có Chắc Chắn Hủy Vé ?'),
                Center(
                    child:
                        Text(number == 'Đánh Giá Chuyến Đi' ? setText() : '')),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                  number == 'Đánh Giá Chuyến Đi' ? 'Gửi Đánh Giá' : 'Đồng Ý'),
              onPressed: () {
                if (number == 'Đánh Giá Chuyến Đi') {
                  setState(() {
                    choose0 = false;
                    choose1 = false;
                    choose2 = false;
                    choose3 = false;
                    choose4 = false;
                    doing = true;
                  });
                  //api
                } else {
                  //api
                }

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
