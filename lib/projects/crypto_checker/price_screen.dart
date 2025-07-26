import 'package:flutter/material.dart';
import 'coin_data.dart';

CoinData coinData = CoinData();

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  PriceScreenState createState() => PriceScreenState();
}

class PriceScreenState extends State<PriceScreen> {
  List<DropdownMenuItem> currencyItemList = [];
  Map<String, int> updatedCryptoList = {};
  String selectedCurrency = 'USD';
  int currencyValue = 0;

  void listBuilder() {
    for (var currency in currenciesList) {
      currencyItemList.add(
        DropdownMenuItem(
          value: currency,
          child: Text(currency),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listBuilder();
    updateUI(selectedCurrency);
  }

  void updateUI(String selectedCurrency) async {
    for (String coinName in cryptoList) {
      var coinSpecificData = await coinData.getCoinData(selectedCurrency, coinName);
      setState(() {
        double coinDataValue = coinSpecificData['rate'];
        currencyValue = coinDataValue.toInt();
        //use the currencyValue to the corresponding coin. and display that. will have to go through a mapped list? with a key and a value.
        updatedCryptoList[coinName] = currencyValue;
        debugPrint(updatedCryptoList.toString());
      });
    }
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
        children: [
          Expanded(
            flex: 4,
            child: ListView.builder(
              itemCount: cryptoList.length,
              itemBuilder: (BuildContext context, int index) {
                String coinName = cryptoList[index];
                int? coinValue = updatedCryptoList.containsKey(coinName) ? updatedCryptoList[coinName] : 0;
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
                        '1 $coinName = $coinValue $selectedCurrency',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: DropdownButton(
                  value: selectedCurrency,
                  items: currencyItemList,
                  onChanged: (value) {
                    setState(() {
                      selectedCurrency = value;
                      updateUI(selectedCurrency);
                    });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}




//todo list
// Use the api to convert the current bitcoin price into a currency that is chosen by the user. for now lets just start with usd and expand as we go. 
  // to do this we need to grab the api of our chosen platform - coinapi.io -
  // then we need to implement the api and run our specific codes through to grab the correct values and coin.
  // we tthen grab the value provided by the api and feed the value into the widget.


//Silver -> make the currencyValue change according to the selected currency the user selects. 
  // get the value from the drop down item. then feed that back into the url for the api_get file. to then display the corresponding api. 



  //Gold -
  // currently having problems extract each specific coin value and parsing them to the respected widget. 
  // we have a list of crypto coins. with our current functions we have the 




  //future improvements
  // Learn how to change the values at the same time and speed up the process. currently it is waiting awhile for each value to change.
  // i think if i really wanted to speed this up. i would grab all values at initialisation for all currencies and build a map for each currency so that they are interchangable as the user selects through the currencies. one result in less reads two speed up the dispaly. con not as accurate.