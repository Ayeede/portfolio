import 'package:cv_main_project/projects/crypto_checker/get_api.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

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
  'ZAR',
];

const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];

class CoinData {
  Future getCoinData(String selectedCurrency, String coinName) async {
    NetworkHelper networkHelper = NetworkHelper('$url/$coinName/$selectedCurrency?apikey=$apiKey');

    var coinData = await networkHelper.getData();
    String coinRate = coinData['rate'].toString();
    debugPrint(coinRate);
    return coinData;
  }
}
