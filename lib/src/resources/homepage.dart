import 'package:flutter/material.dart';
import 'package:flutter_app/src/tab/bus.dart';
import 'package:flutter_app/src/tab/maiticket.dart';
import 'package:flutter_app/src/tab/profile.dart';
import 'package:flutter_app/src/tab/search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> screens = [
    Search(),
    MyTicket(),
    Bus(),
    Profile(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Search();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.blue,
        child: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color:Colors.blue,
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                         setState(() {
                           currentScreen = Search();
                           _currentIndex = 0;
                         });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search,
                                color: _currentIndex == 0
                                    ? Colors.white
                                    : Colors.black),
                            Text('Tìm Vé',
                                style: TextStyle(
                                    color: _currentIndex == 0
                                        ? Colors.white
                                        : Colors.black))
                          ],
                        )),
                    MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = MyTicket();
                            _currentIndex = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.business,
                                color: _currentIndex == 1
                                    ? Colors.white
                                    : Colors.black),
                            Text('Vé Của Tôi',
                                style: TextStyle(
                                    color: _currentIndex == 1
                                        ? Colors.white
                                        : Colors.black))
                          ],
                        )),
                    MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = Bus();
                            _currentIndex = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.directions_railway,
                                color: _currentIndex == 2
                                    ? Colors.white
                                    : Colors.black),
                            Text('Tuyến Xe',
                                style: TextStyle(
                                    color: _currentIndex == 2
                                        ? Colors.white
                                        : Colors.black))
                          ],
                        )),
                    MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = Profile();
                            _currentIndex = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person,
                                color: _currentIndex == 3
                                    ? Colors.white
                                    : Colors.black),
                            Text('Cài Đặt',
                                style: TextStyle(
                                    color: _currentIndex == 3
                                        ? Colors.white
                                        : Colors.black))
                          ],
                        ))

                  ],
                )
              ],
            ),
          )),
    );
  }
}
