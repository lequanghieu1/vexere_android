import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Noti extends StatefulWidget {
  @override
  _NotiState createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  List dummyList;
  ScrollController _sC = ScrollController();
  int _max = 10;
  @override
  void initState() {
    super.initState();
    dummyList = List.generate(10, (index) => "Thông Báo ${index + 1}: Đặt Thành Công Vé 609945fg89vfd97${index+1} ");
    _sC.addListener(() {
      if (_sC.position.pixels == _sC.position.maxScrollExtent) {
        _getMore();
      }
    });
  }

  _getMore() {
    for (int i = _max; i < _max + 10; i++) {
      dummyList.add("Item: ${i + 1}");
    }
    _max = _max + 10;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: ListView.builder(
          controller: _sC,
          itemExtent: 80,
          itemCount: dummyList.length + 1,
          itemBuilder: (context, index) {
            if (index == dummyList.length) {
              return CupertinoActivityIndicator();
            }
            return ListTile(
              title: Text(dummyList[index]),
            );
          }),
    );
  }
}
