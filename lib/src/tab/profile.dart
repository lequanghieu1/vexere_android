import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/src/resources/login_page.dart';
import 'package:flutter_app/src/tab/helpCenter.dart';
import 'package:flutter_app/src/tab/profile_menu.dart';
import 'package:flutter_app/src/tab/profile_pic.dart';
import 'package:flutter_app/src/tab/question.dart';
import 'package:flutter_app/src/tab/notification.dart';
import 'package:flutter_app/src/tab/settings.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Tài Khoản Của Tôi",
            icon: "assets/icons/User Icon.svg",
            press: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ProfileApp()))
            },
          ),
          ProfileMenu(
            text: "Thông Báo",
            icon: "assets/icons/Bell.svg",
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Noti()));
            },
          ),
          ProfileMenu(
            text: "Cài Đặt",
            icon: "assets/icons/Settings.svg",
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Setting()));
            },
          ),
          ProfileMenu(
            text: "Trung Tâm Trợ Giúp",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HelpCenter()));
            },
          ),
          ProfileMenu(
            text: "Đăng Xuất",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
