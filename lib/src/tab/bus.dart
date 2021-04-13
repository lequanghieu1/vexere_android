import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List dataDummy = [
  {
    "albumId": 1,
    "id": 1,
    "title": "Hà Nội --> Cà Mau",
    "group": "Hiếu HT",
    "date": "24/12/2020",
    "price": "1.000.000"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "Sài Gòn --> Thanh Hóa",
    "group": "An Chè",
    "date": "02/02/2021",
    "price": "700.000"
  },
  {
    "albumId": 1,
    "id": 3,
    "title": "Sài Gòn --> Miền Tây",
    "group": "Hida",
    "date": "04/10/2014",
    "price": "300.000"
  },
  {
    "albumId": 1,
    "id": 4,
    "title": "Thanh Hóa --> Miền Tây",
    "group": "Hải Dóng",
    "date": "24/12/2020",
    "price": "800.000"
  },
];

class Bus extends StatefulWidget {
  @override
  _BusState createState() => _BusState();
}

class _BusState extends State<Bus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Danh Sách Tuyến Xe')),
      body: GroupedListView<dynamic, String>(
        elements: dataDummy,
        groupBy: (element) => element['date'],
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
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                element['title'],
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
                                    child: Text('${element['group']}'),
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
                                    child: Text('${element['price']}'),
                                  )
                                ],
                              ),
                            )
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
