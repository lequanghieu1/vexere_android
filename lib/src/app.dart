import 'package:flutter/material.dart';
import 'package:flutter_app/src/resources/login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
        home: LoginPage(),
    );
  }
}