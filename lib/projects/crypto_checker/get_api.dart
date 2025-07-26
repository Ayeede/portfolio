import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    final mainURL = Uri.parse(url);
    http.Response response = await http.get(mainURL);

    String data = response.body;
    return jsonDecode(data);
  }
}
