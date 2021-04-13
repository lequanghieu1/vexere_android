import 'package:flutter/material.dart';
import 'package:flutter_app/model/photo.dart';

class GridDetails extends StatefulWidget {
  final Photo photo;
  GridDetails({@required this.photo});
  @override
  _GridDetailsState createState() => _GridDetailsState();
}

class _GridDetailsState extends State<GridDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: "Photo${widget.photo.sId}",
            child: FadeInImage.assetNetwork(
                placeholder: 'no_image.png', image: widget.photo.url),
          ),
          SizedBox(
            height: 30,
            // ignore: deprecated_member_use
          ),
          RaisedButton(
              child: Text('Quay Lại',style: TextStyle(color: Colors.white)),
              color: Colors.blue.shade200,
              onPressed: () => Navigator.of(context).pop())
        ],
      ),
    ));
  }
}
