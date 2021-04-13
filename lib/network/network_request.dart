import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/model/photo.dart';

class NetworkRequest{
  static List<Photo> parsePhotos(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Photo> photos = list.map((model) => Photo.fromJson(model)).toList();
    return photos;
  }
  static Future<List<Photo>> fetchPhotos() async {
    var url = Uri.parse('http://192.168.1.8:4040/model-device');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return compute(parsePhotos,response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

}