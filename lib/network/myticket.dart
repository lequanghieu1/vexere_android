import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/network/getAPI.dart';
import 'package:flutter_app/src/blocs/share.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/model/buyTicket.dart';

List<BuyTicket> parseBuyTicket(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<BuyTicket> mytickets =
      list.map((model) => BuyTicket.fromJson(model)).toList();

  return mytickets;
}

Future<List<BuyTicket>> fetchTicKet() async {
  SharedPref share = new SharedPref();
  String email = '';
  email = await share.read('user');
  email = jsonDecode(email);
  String hot = handlehot();
  List<BuyTicket> lists = [];
  var url = Uri.parse('$hot/user/tickets?email=$email');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    List ticket = jsonDecode(response.body) as List;
    ticket.forEach((element) {
      lists.add(BuyTicket.fromJson(element));
    });
    email = lists[0].email;
    return compute(parseBuyTicket, response.body);
  } else {
    throw Exception('Failed to get API');
  }
}
