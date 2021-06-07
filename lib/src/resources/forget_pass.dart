import 'package:flutter/material.dart';
import 'package:flutter_app/network/getAPI.dart';
import 'package:flutter_app/src/blocs/auth_bloc.dart';
import 'package:flutter_app/src/resources/login_page.dart';
import 'package:http/http.dart' as http;

class ForgetPass extends StatefulWidget {
  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  AuthBloc authBloc = new AuthBloc();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 140,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: StreamBuilder(
                    stream: authBloc.emailStream,
                    builder: (context, snapshot) => TextField(
                          controller: _emailController,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Email",
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              prefixIcon: Container(
                                  width: 50, child: Image.asset("ic_mail.png")),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffCED0D2), width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)))),
                        )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: _onLoginClick,
                    child: Text(
                      "Gửi",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: Color(0xff3277D8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onLoginClick() async {
    String hot = handlehot();
    var Forget = authBloc.Forget(_emailController.text);
    if (Forget) {
      var url = Uri.parse('$hot/m/forgot');
      var response =
          await http.post(url, body: {'email': _emailController.text});
      if (response.statusCode == 200) {
        print(response.body);
        showAlertDialog(context,
            "Reset mật khẩu thành công,Hãy kiểm tra email của bạn", 200);
      } else {
        showAlertDialog(context, "Email không tồn tại,hãy thử lại", 400);
      }
    }
  }

  showAlertDialog(BuildContext context, data, status) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Thông báo"),
      content: Text("${data}"),
      actions: [
        FlatButton(
          child: Text("Đóng lại"),
          onPressed: () {
            Navigator.of(context).pop();
            if (status == 200) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            }
          },
        )
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
