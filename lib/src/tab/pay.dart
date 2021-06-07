import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_app/src/resources/overviewPay.dart';
import 'package:flutter_app/src/blocs/share.dart';
import 'package:grouped_list/grouped_list.dart';

class Pay extends StatefulWidget {
  @required
  final List chair;

  const Pay( this.chair);
  @override
  _PayState createState() => _PayState(chair);
}

class _PayState extends State<Pay> {
  @required
  final List chair;

  _PayState( this.chair);
  String info;
  SharedPref shares = new SharedPref();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xem Lại Vé'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.article_outlined),
            onPressed: () => {print("Click on upload button")},
          ),
        ],
      ),
      body: GroupedListView<dynamic, String>(
        elements: chair,
        groupBy: (element) => element,
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
              )),
              RaisedButton(
                onPressed: () async => {
                  //  info = await jsonDecode(shares.read('jwt')),
                  // print(info),
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditInfo(
                              'kanon', ' Lã Xuân Oai,Q9,TPHCM', '0123456789',chair)))
                },
                child: Icon(Icons.edit),
                color: Colors.yellowAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
              ),
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
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                'frgr' + ' ==> ' + 'trg',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(Icons.account_circle_sharp,
                                      color: Colors.grey, size: 16),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text('Kanon'),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(Icons.date_range_rounded,
                                      color: Colors.grey, size: 16),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text('22-10-2020'),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(Icons.money,
                                      color: Colors.grey, size: 16),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text('10000'),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(Icons.local_phone_outlined,
                                      color: Colors.grey, size: 16),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text('0123456789'),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(Icons.location_on_outlined,
                                      color: Colors.grey, size: 16),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(' Lã Xuân Oai,Q9,TPHCM'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        },
        itemComparator: (item1, item2) =>
            item1['title'].compareTo(item2['title']), // optional
        useStickyGroupSeparators: true, // optional
        floatingHeader: true, // optional
        order: GroupedListOrder.ASC, // optional
      ),
    );
  }
}
