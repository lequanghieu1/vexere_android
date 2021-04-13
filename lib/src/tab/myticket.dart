import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/cell/GridDetails.dart';
import 'package:flutter_app/cell/grid_cell.dart';
import 'package:flutter_app/model/photo.dart';
import 'package:flutter_app/network/network_request.dart';


class Ticket extends StatefulWidget {
  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vé Của Bạn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  gridview(AsyncSnapshot<List<Photo>> snapshot) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          children: snapshot.data.map((photo) {
            return GestureDetector(
              child: GridTile(
                child: PhotoCell(photo),
              ),
              onTap: () {
                gotoDetailsPage(context, photo);
              },
            );
          }).toList(),
        ));
  }

  gotoDetailsPage(BuildContext context, Photo photo) {
    Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
            builder: (BuildContext context) => GridDetails(photo: photo)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vé Bạn Đã Đặt')),
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
                  return gridview(snapshot);
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
