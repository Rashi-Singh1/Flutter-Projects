import 'dart:io' show Platform; //only needed this particular class from dart.io

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
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
      },
      children: pickerList,
    );
  }

  Widget getCurList() {
    if (Platform.isIOS)
      return getPicker();
    else
      return getDropDownButton();
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
          Padding(
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
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getCurList(),
          )
        ],
      ),
    );
  }
}
