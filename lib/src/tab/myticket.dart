import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/cell/grid_cell.dart';
import 'package:flutter_app/model/photo.dart';

import 'package:flutter_app/network/network_request.dart';
import 'package:flutter_app/src/tab/pay.dart';
import 'package:flutter_app/src/tab/search.dart';

class Ticket extends StatefulWidget {
  @required
  final String to;
  final String from;
  final String date;
  final String price;

  const Ticket(this.to, this.from, this.date, this.price);
  @override
  _TicketState createState() =>
      _TicketState(this.to, this.from, this.date, this.price);
}

class _TicketState extends State<Ticket> {
  @required
  final String to;
  final String from;
  final String date;
  final String price;

  _TicketState(this.to, this.from, this.date, this.price);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vé Của Bạn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(to, from, date, price),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @required
  final String to;
  final String from;
  final String date;
  final String price;

  const Home(this.to, this.from, this.date, this.price);
  @override
  _HomeState createState() => _HomeState(to, from, date, price);
}

class _HomeState extends State<Home> {
  @required
  final String to;
  final String from;
  final String date;
  final String price;
  List listTicket = [];
  List listDataFinal = [];

  _HomeState(this.to, this.from, this.date, this.price);
  gridview(AsyncSnapshot<List<Photo>> snapshot) {
    return Padding(
        padding: EdgeInsets.all(3),
        child: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          children: snapshot.data.map((photo) {
            return GestureDetector(
              child: GridTile(
                child:
                    PhotoCell(photo, listTicket, listDataFinal, to, from, date),
              ),
              onTap: () {},
            );
          }).toList(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Back() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Search()));
    }

    Continue() {
     if(listTicket.length == 0){
       _showMyDialog();
     }else{
       Navigator.push(
           context,
           MaterialPageRoute(
               builder: (context) => Pay(to, from, date, price, listTicket)));
     }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Hãy chọn ghế trống')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: FutureBuilder<List<Photo>>(
              future: NetworkRequest.fetchPhotos(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Container(
                    child: gridview(snapshot),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: SizedBox(
                      width: 150,
                      height: 52,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: Back,
                        child: Text(
                          "Quay Lại",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 52,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: Continue,
                      child: Text(
                        "Tiếp Theo",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cảnh Báo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bạn Chưa Chọn Ghế Nào'),
                Text('Hãy chọn ít nhất 1 ghế để tiếp tục'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tôi hiểu'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
