import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String valueChoose = "Tiếng Việt";
  List listItem = ['Tiếng Việt', 'English'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Setting')),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 0,
                ),
                Text(
                  "Ngôn Ngữ",
                  style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(9)),
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(fontSize: 22, color: Colors.black),
                        value: valueChoose,
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue;
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

              ],
            ),
          )),
    );
  }
}
