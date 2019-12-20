import 'dart:io' show Platform; //only needed this particular class from dart.io

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = new CoinData();

  List<String> exchange = new List(cryptoList.length);

  String selectedCurrency = currenciesList[0];

  DropdownButton<String> getDropDownButton() {
    //generate the list
    List<DropdownMenuItem<String>> dropDownItemList = new List();
    for (String cur in currenciesList) {
      var item = DropdownMenuItem(
        child: Center(child: Text(cur)),
        value: cur,
      );
      dropDownItemList.add(item);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItemList,
      onChanged: (String value) {
        print(value);
        setState(() {
          selectedCurrency = value;
          getExchange();
        });
      },
    );
  }

  CupertinoPicker getPicker() {
    List<Center> pickerList = new List();
    for (String cur in currenciesList) {
      pickerList.add(Center(child: Text(cur)));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 35.0,
      onSelectedItemChanged: (int position) {
        print(currenciesList[position]);
        setState(() {
          selectedCurrency = currenciesList[position];
          getExchange();
        });
      },
      children: pickerList,
    );
  }

  void getExchange() async {
    for (int i = 0; i < cryptoList.length; i++) {
      exchange[i] = '0.0';
    }
    try {
      for (int i = 0; i < cryptoList.length; i++) {
        double data = await coinData.getCoinData(
            curCode: selectedCurrency, cryptoType: cryptoList[i]);
        print('data for ${cryptoList[i]} : $data');
        setState(() {
          exchange[i] = data.toStringAsFixed(0);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getExchange();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CryptoCurButton(
                exchange: exchange[0],
                selectedCurrency: selectedCurrency,
                cryptoType: cryptoList[0],
              ),
              CryptoCurButton(
                exchange: exchange[1],
                selectedCurrency: selectedCurrency,
                cryptoType: cryptoList[1],
              ),
              CryptoCurButton(
                exchange: exchange[2],
                selectedCurrency: selectedCurrency,
                cryptoType: cryptoList[2],
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getPicker() : getDropDownButton(),
          )
        ],
      ),
    );
  }
}

class CryptoCurButton extends StatelessWidget {
  const CryptoCurButton(
      {@required this.exchange,
      @required this.selectedCurrency,
      @required this.cryptoType});

  final String exchange;
  final String selectedCurrency;
  final String cryptoType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoType = $exchange $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
