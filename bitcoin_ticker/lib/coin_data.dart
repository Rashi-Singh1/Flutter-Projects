import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const String URL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class CoinData {
  Future getCoinData({String curCode, String cryptoType}) async {
    String request = URL + cryptoType + curCode;
    print(request);
    http.Response response = await http.get(request);
    if (response.statusCode == 200) {
      String data = response.body;
      print(jsonDecode(data)['last']);
      return jsonDecode(data)['last'];
    } else {
      print('Error : ${response.statusCode}');
      return null;
    }
  }
}
