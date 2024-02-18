import 'dart:convert';

import 'package:abd_shop/screens/home/components/market_item_widget.dart';
import 'package:abd_shop/models/market_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MarketListWidget extends StatefulWidget {
  const MarketListWidget({super.key});

  @override
  State<MarketListWidget> createState() => _MarketListWidgetState();
}

class _MarketListWidgetState extends State<MarketListWidget> {
  String text = '';
  List<Market> marketsList = [];
  List<MarketItemWidget> marketsWidgetList = [];
  getMarkets() async {
    //for get ip address in cmd or terminal
    //write "ipconfig"
    Uri url = Uri.parse("http://192.168.1.100/abd_shop/getmarket.php");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('getmarket');
      String json = response.body;
      List<dynamic> data = jsonDecode(json);
      for (var item in data) {
        Market market = Market.fromJSON(item);
        marketsList.add(market);
        // OR
        // marketsList.add(Market.fromJSON(item));
        marketsWidgetList.add(MarketItemWidget(
          market: market,
        ));
      }

      text = marketsList[0].name;
      setState(() {});
    } else {
      print("** ERORR STATUS CODE: ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    getMarkets();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: marketsWidgetList,
      );
  }
}
