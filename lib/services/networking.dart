import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({this.url});
  String? url;

  Future getData(Url) async {
    var client = http.Client();
    http.Response response = await client.get(Url);
    if (response.statusCode == 200) {
      // String data = response.body;
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      print("unable to get the temparature");
    }
  }
}
