import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;
  NetworkHelper(this.url);

  Future getData() async {
    //added 'as' in import to make this easier to read (that this uses http package)
    http.Response response = await http.get(url);
    //Response class is used when the entire response body is known at once
    if (response.statusCode == 200) {
      String responseData = response.body;
      return jsonDecode(responseData);
    } else
      print('error code: ${response.statusCode}');
  }
}
