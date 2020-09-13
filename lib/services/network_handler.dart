import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHandler {
  NetworkHandler();

  static Future<dynamic> httpRequest(String url) async {
    http.Response response = await http.get(url);
    var data = JsonDecoder().convert(response.body);
    return data;
  }

}