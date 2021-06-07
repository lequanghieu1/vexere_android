
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/model/photo.dart';

class PhotoCell extends StatefulWidget {
  @required
  final Photo photo;
  final List listTicket;
  final List listDataFinal;
  final String to;
  final String from;
  final String date;
  const PhotoCell(this.photo, this.listTicket, this.listDataFinal, this.to,
      this.from, this.date);
  @override
  _PhotoCellState createState() =>
      _PhotoCellState(photo, listTicket, listDataFinal, to, from, date);
}

class _PhotoCellState extends State<PhotoCell> {
  var color = 'white';
  var choose = false;

  @required
  final Photo photo;
  final List listTicket;
  final List listDataFinal;
  final String to;
  final String from;
  final String date;
  _PhotoCellState(this.photo, this.listTicket, this.listDataFinal, this.to,
      this.from, this.date);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: 
         photo.choose == '0'
          ? color == 'white'
              ? Colors.white
              : Colors.red
          : photo.choose == '2'
              ? Colors.grey
              : Colors.grey,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: "Photo${photo.choose}",
                  child: photo.choose == '0'
                      ? RaisedButton(
                          onPressed: listTicket.length <= 3
                              ? () => {
                                    if (choose == false &&
                                        listTicket.length < 3)
                                      {
                                        setState(() {
                                          color = 'red';
                                          choose = true;
                                          listTicket.add(photo.code);
                                        }),
                                      }
                                    else if (choose == true)
                                      {
                                        setState(() {
                                          color = 'white';
                                          choose = false;
                                          listTicket.remove(photo.code);
                                        }),
                                      },
                                    print(listTicket),
                                  }
                              : null,
                          child: Text(
                            choose == false ? "Mua" : "Hủy",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          color: Color(0xff3277D8),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                        )
                      : FadeInImage.assetNetwork(
                          placeholder: 'no_image.png',
                          image: 'https://www.vhv.rs/dpng/d/418-4187632_your-home-is-under-contract-sold-out-icon.png',
                          width: 100,
                          height: 100),
                ),
              )),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  photo.code,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
