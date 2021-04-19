import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/model/buyTicket.dart';

List<BuyTicket> parseBuyTicket(String responseBody) {
var list = json.decode(responseBody) as List<dynamic>;
List<BuyTicket> mytickets = list.map((model) => BuyTicket.fromJson(model)).toList();
return mytickets;
}
Future<List<BuyTicket>> fetchTicKet() async {
var url = Uri.parse('http://192.168.4.105:4040/page-schema');
var response = await http.get(url);
if (response.statusCode == 200) {
return compute(parseBuyTicket,response.body);
} else {
throw Exception('Failed to get API');
}
}